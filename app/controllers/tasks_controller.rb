class TasksController < ApplicationController
	def destroy
		@task.destroy
		redirect_to root_url
	end
end
