class AddGachaToItemMaster < ActiveRecord::Migration[6.0]
  def change
    add_column :item_masters, :gacha, :boolean
  end
end
