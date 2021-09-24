class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item_master
end
