class CreateMixtunes < ActiveRecord::Migration[6.0]
  def change
    create_table :mixtunes do |t|
      t.string :generation
      t.string :material

      t.timestamps
    end
  end
end
