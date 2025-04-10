class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :point, default: 0
      t.string :nickname
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
