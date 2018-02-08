class Dependency < ApplicationRecord
	belongs_to :task, optional: true
end
