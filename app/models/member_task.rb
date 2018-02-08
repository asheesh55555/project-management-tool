class MemberTask < ApplicationRecord
	def self.member_tasks(team_id, user_id, project_id)
		 @tasks = []	
		  member_tasks = self.where(team_id: team_id, user_id: user_id, project_id: project_id)
		  member_tasks.each do |task|
	        task =Task.find(task.task_id)
	        @tasks.push(task)
		  end 
		  return @tasks
		end
end
