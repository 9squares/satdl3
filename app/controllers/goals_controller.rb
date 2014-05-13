class GoalsController < ApplicationController
	before_action :authenticate_user!

	def create
		@goal = current_user.goals.build(goal_params)
		if @goal.save
			@goal.create_activity :create, owner: current_user
			flash[:success] = "Task created!"
			redirect_to profile_path
		else
			render 'static_pages/home'
		end
	end

	def show
		@goal = Goal.find_by(id: params[:id])
		@user = @goal.user
	end

	def update
	end

	def destroy
		@goal = current_user.goals.find_by(id: params[:id])
		@goal.destroy
		redirect_to profile_path
	end

	private

		def goal_params
			params.require(:goal).permit(:title)
		end
end
