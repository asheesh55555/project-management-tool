class Project < ApplicationRecord
	mount_uploader :document, DocumentUploader
    has_many :tasks
    has_many :project_teams
    has_many :teams, through: :project_teams
    has_many :user_projects
    has_many :users, through: :user_projects 
end
