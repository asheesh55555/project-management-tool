class AddStatusIdToTechnologies < ActiveRecord::Migration[5.1]
  def change
  	add_column :technologies, :status_id, :integer
  end
end
