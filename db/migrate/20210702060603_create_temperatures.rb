class CreateTemperatures < ActiveRecord::Migration[6.0]
  def change
    create_table :temperatures do |t|
      t.float :taion
      t.string :health
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
