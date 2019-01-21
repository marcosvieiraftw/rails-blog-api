class UserRole < ApplicationRecord
  # Relationships
  has_many :users

  # Validations
  validates :name, :code, presence: true, absence: false
  validates :name, length: {maximum: 50}

  # Constants
  ADMIN = 100
  REGULAR = 200
end
