class TasksController < ApplicationController
	before_action :authenticate_user!

	def create
		@task = current_user.tasks.build(task_params)
		if @task.save
			@task.create_activity :create, owner: current_user
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
		@task.update(task_params)
		@task.create_activity :update, owner: current_user
		redirect_to profile_path
	end

	def show
		@task = Task.find_by(id: params[:id])
		@user = @task.user
		@comment = Comment.new
		@comments = @task.comments
	end

	private

		def task_params
			params.require(:task).permit(:title, :done, :private, :due_date, :goal_id)
		end
end
