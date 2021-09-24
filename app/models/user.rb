class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  has_many :temperatures, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_many :missions, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :items, through: :user_items, source: :item_master
  has_one :profile, dependent: :destroy
end