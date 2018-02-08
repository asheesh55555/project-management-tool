class AddStatusIdToClients < ActiveRecord::Migration[5.1]
  def change
  	add_column :clients, :status_id, :integer 
  end
end
