class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :employee_detail
      t.date :date
      t.boolean :is_admin

      t.timestamps
    end
  end
end
