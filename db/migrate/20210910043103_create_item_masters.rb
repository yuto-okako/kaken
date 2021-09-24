class CreateItemMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :item_masters do |t|
      t.string :path
      t.integer :rare
      t.string :name
      t.string :explanation

      t.timestamps
    end
  end
end
