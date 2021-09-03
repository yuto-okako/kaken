class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  has_many :temperatures, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_many :mission, dependent: :destroy
  has_one :profile, dependent: :destroy
end