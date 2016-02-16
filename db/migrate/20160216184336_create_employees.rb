class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.float :salary

      t.timestamps null: false
    end
  end
end
