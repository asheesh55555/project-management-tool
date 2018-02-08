class CreateProjectTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :project_teams do |t|
      t.integer :team_id
      t.integer :project_id

      t.timestamps
    end
  end
end
