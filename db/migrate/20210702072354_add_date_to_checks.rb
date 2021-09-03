class AddDateToChecks < ActiveRecord::Migration[6.0]
  def change
    add_column :checks, :date, :date
  end
end
