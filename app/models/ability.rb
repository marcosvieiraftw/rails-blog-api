class Ability
  include CanCan::Ability

  def initialize(user)
    # --------------------------------------------------------------------------------------------------------------------------|
    # Using best pratices for giving permissions:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities:-Best-Practices#give-permissions-dont-take-them-away
    return unless user.present?
    can :manage, Post, user_id: user.id
    can :read, Post, user_id: user.social_followings.map(&:id)
    can [:read, :create], Comment, post: { user_id: ([user.id] + user.social_followings.map(&:id)) }
    can [:read, :follow_user, :unfollow_user], User

    return unless user.user_role.code == UserRole::ADMIN
    can :manage, :all
    # --------------------------------------------------------------------------------------------------------------------------|
  end

  # Integration with CASL for frontend rules.
  def to_list
    rules.map do |rule|
      object = { actions: rule.actions, subject: rule.subjects.map{ |s| s.is_a?(Symbol) ? s : s.name } }
      object[:conditions] = rule.conditions unless rule.conditions.blank?
      object[:inverted] = true unless rule.base_behavior
      object
    end
  end

end
