class TasksController < ApplicationController
	def up
		Task.where(id:params[:id]).first.up
		redirect_to root_url
	end

	def down
		Task.where(id:params[:id]).first.down
		redirect_to root_url
	end

	def show
	end

	def toggle
		@task = Task.find(params[:id])
		@task.is_done ^= true
		@task.save!
		render nothing: true
	end

	def destroy
		Task.find(params[:id]).destroy
		if request.xhr?
			render nothing: true
		else
			redirect_to root_url
		end
	end

	def create
		@task = Task.create!(task_params)
		send_ajax_respond and return if request.xhr?
		redirect_to root_url
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		if Task.find(params[:id]).update_attributes(task_params)
			redirect_to root_url
		else
			redirect_to edit_project_task_path(params)
		end
	end

	private 
		def send_ajax_respond
			render partial: 'shared/task', locals: {project: @task.project, t: @task}, layout: false 
		end

		def task_params
			params.require(:task).permit(:title, :project_id, :priority, :deadline)
		end

end
