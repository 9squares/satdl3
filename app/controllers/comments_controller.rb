class CommentsController < ApplicationController
	def create
		@task = Task.find(params[:task_id])
		@comment = @task.comments.build(comment_params)
		@comment.user = current_user
		@comment.save
		redirect_to task_path(@task)
	end

	def destroy
		@task = Task.find(params[:task_id])
		@comment = @task.comments.find(params[:id])
		@comment.destroy
		redirect_to task_path(@task)
	end

	private
		def comment_params
			params.require(:comment).permit(:user_id, :body)
		end
end
