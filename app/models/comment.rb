class Comment < ApplicationRecord
  has_soft_deletion default_scope: true

  # Relationships
  belongs_to :user
  belongs_to :post

  # Validations
  validates :description, presence: true, absence: false
end
