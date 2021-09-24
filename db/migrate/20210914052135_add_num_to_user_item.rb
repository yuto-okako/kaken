class AddNumToUserItem < ActiveRecord::Migration[6.0]
  def change
    add_column :user_items, :num, :integer
  end
end
