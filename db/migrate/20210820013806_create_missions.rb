class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :type
      t.string :reward
      t.boolean :dayly
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
