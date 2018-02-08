class AddTaskIdToDependencies < ActiveRecord::Migration[5.1]
  def change
  	add_column :dependencies, :task_id, :integer
  end
end
