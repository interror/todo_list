class ProjectsController < ApplicationController
	def index
		if current_user 
			@projects=current_user.projects.to_a
			@new_task = Task.new
			@new_project = Project.new
		else
			redirect_to log_in_path
		end
	end

	def create
		@project = current_user.projects.create!(project_params)
		@new_task = Task.new
		send_ajax_respond and return if request.xhr?
		redirect_to root_url
	end

	def edit
		@project = Project.find(params[:id])
	end

	def destroy
		Project.find(params[:id]).destroy
		if request.xhr?
			render nothing: true
		else
			redirect_to root_url
		end
	end

	def update
		if current_user.projects.find(params[:id]).update_attributes(project_params)
			render nothing: true
		else
			
		end
	end

	private

		def send_ajax_respond
			render partial: 'project', locals: {project: @project}, layout: false 
		end

		def project_params
			params.require(:project).permit(:title)
		end
end
