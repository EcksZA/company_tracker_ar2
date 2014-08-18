class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :name, :string
      t.column :current, :boolean
      t.column :employee_id, :int
      t.timestamps
    end
  end
end
