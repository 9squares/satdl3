class TasksController < ApplicationController
	before_action :authenticate_user!

	def create
		@task = current_user.tasks.build(task_params)
		if @task.save
			flash[:success] = "Task created!"
			redirect_to profile_path
		else
			render 'static_pages/home'
		end
	end

	def destroy
		@task = current_user.tasks.find_by(id: params[:id])
		@task.destroy
		redirect_to profile_path
	end

	def update
		@task = current_user.tasks.find_by(id: params[:id])
		@task.update(params[:task].permit(:title, :done))
		redirect_to profile_path
	end

	private

		def task_params
			params.require(:task).permit(:title, :done)
		end
end
