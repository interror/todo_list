class Task < ActiveRecord::Base

	belongs_to :project

	before_create :init_priority

	validates :title, presence: true
	validates :priority, :title, uniqueness: true

	def raise_priority
	end

	def lower_priority
	end

	private

		def init_priority
			highest_priority_task = Task.where(project_id: self.project_id).order(priority: :desc).first
			self.priority=if highest_priority_task
				highest_priority_task.priority + 1
			else
				0
			end
		end
end
