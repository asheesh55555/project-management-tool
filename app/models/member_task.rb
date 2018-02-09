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

		def self.assigned_task(user_id, project_id)
			self.where(team_id: User.find(user_id).team.id,  user_id: user_id, project_id: project_id)
		end

		def self.un_assigned_task(project)
			@un_assigned_task = []
        project.tasks.each do |t|
            unless self.where(task_id: t.id).first.present?
              @un_assigned_task.push(t)
            end
        end
       return @un_assigned_task
		end

end
