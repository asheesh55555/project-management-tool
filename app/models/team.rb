class Team < ApplicationRecord
	 has_many :users
	 has_many :project_teams
     has_many :projects, through: :project_teams
end
