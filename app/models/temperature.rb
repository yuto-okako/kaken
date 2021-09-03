class Temperature < ApplicationRecord
  validates :taion, presence: true, numericality: {greater_than_or_equal_to: 30.0, less_than_or_equal_to: 45.0}, format: {with: /\A[0-9][0-9](.[0-9])\z/}
  belongs_to :user
end