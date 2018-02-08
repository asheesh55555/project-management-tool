class AddCostToProjects < ActiveRecord::Migration[5.1]
  def change
  	add_column :projects, :cost, :float, default: 0.00
  end
end
