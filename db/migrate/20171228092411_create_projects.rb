class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :descriptions
      t.string :technology
      t.string :document
      t.string :project_type
      t.string :client_name

      t.timestamps
    end
  end
end
