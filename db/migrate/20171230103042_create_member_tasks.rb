class CreateMemberTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :member_tasks do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :project_id
      t.integer :task_id

      t.timestamps
    end
  end
end
