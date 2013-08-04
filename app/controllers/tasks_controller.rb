class TasksController < ApplicationController

	def show

	end

	def destroy
		Task.find(params[:id]).destroy
		redirect_to root_url
	end

	def create
		Task.create!(task_params)
		redirect_to root_url
	end

	private 
		def task_params
			params.require(:task).permit(:title, :project_id, :deadline)
		end

end
