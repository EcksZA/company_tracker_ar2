class DeleteEmployeeTablesTable < ActiveRecord::Migration
  def change
    drop_table :employee_tables
  end
end
