class RenameTypeColumnToMissions < ActiveRecord::Migration[6.0]
  def change
    rename_column :missions, :type, :reward_type
  end
end
