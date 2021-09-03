class AddNumberToMission < ActiveRecord::Migration[6.0]
  def change
    add_column :missions, :number, :integer
  end
end
