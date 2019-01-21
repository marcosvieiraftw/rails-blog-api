class User < ApplicationRecord
  has_soft_deletion default_scope: true
  has_secure_password

  # Relationships
  belongs_to :user_role
  has_many :posts
  has_many :comments
  has_many :followers
  has_many :social_followers, through: :followers, source: :follower
  # ----- Inverse relationship to retrieve who user is following ----------------|
  has_many :followings, :class_name => "Follower", :foreign_key => "follower_id"
  has_many :social_followings, :through => :followings, :source => :user
  # -----------------------------------------------------------------------------|

  # Validations
  validates :name, :email, length: {maximum: 60}, presence: true, absence: false
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def create_follower(follower_id)
    if self.followers.create!(user_id: self.id, follower_id: follower_id)
      return true
    end

    return false
  end

  def destroy_follower(follower_id)
    if Follower.where(user_id: self.id, follower_id: follower_id).destroy_all.empty?
      errors.add(:base, :follower_not_found)
      return false
    end

    return true
  end
end
