class Post < ApplicationRecord
  has_soft_deletion default_scope: true

  # Relationships
  belongs_to :user
  has_many :comments

  # Validations
  validates :title, :description, presence: true, absence: false
  validates :title, length: {maximum: 70}
end
