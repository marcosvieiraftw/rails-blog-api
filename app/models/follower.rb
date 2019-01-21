class Follower < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :follower, class_name: 'User'

  # Validations
  validates_uniqueness_of :user_id, scope: :follower_id, message: I18n.t('user.follower_already_created')
end
