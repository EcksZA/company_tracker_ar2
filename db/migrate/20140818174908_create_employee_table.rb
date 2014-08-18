class CreateEmployeeTable < ActiveRecord::Migration
  def change
    create_table :employee_tables do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
