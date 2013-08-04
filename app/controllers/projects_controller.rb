class ProjectsController < ApplicationController
	def index
		@projects=Project.all.to_a
		@new_task = Task.new
	end

	def destroy
		Project.find(params[:id]).destroy
		redirect_to root_url
	end
end
