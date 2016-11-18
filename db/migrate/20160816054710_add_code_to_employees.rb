class AddCodeToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :code, :string
  	add_column :employees, :department_id, :integer
  end
end
