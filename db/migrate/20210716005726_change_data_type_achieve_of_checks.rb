class ChangeDataTypeAchieveOfChecks < ActiveRecord::Migration[6.0]
  def change
    change_column :checks, :achieve, :string
  end
end
