class UserProject < ApplicationRecord
	 belongs_to :user
   belongs_to :project

   def self.is_already_assingned?(user_id, project_id)
   	 self.where(user_id: user_id, project_id: project_id).first.present?
   end

end
