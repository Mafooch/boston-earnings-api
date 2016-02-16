class ChangeSalaryToDecimal < ActiveRecord::Migration
  def up
    change_column :employees, :salary, :decimal, precision: 9, scale: 2
  end

  def down
    change_column :employees, :salary, :float
  end
end
