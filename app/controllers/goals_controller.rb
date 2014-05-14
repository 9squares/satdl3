class GoalsController < ApplicationController
	before_action :authenticate_user!

	def create
		@goal = current_user.goals.build(goal_params)
		if @goal.save
			@goal.create_activity :create, owner: current_user
			flash[:success] = "Task created!"
			redirect_to goals_path
		else
			render 'static_pages/home'
		end
	end

	def show
		@goal = Goal.find_by(id: params[:id])
		@user = @goal.user
	end

	def index
		@user = current_user
		@goals = @user.goals.reject(&:new_record?)
		@goal = @user.goals.build
		@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_users)
	end

	def update
		@goal = current_user.goals.find_by(id: params[:id])
		@goal.update(goal_params)
		@goal.create_activity :update, owner: current_user
		redirect_to goals_path
	end

	def destroy
		@goal = current_user.goals.find_by(id: params[:id])
		@goal.destroy
		redirect_to goals_path
	end

	private

		def goal_params
			params.require(:goal).permit(:title, :done)
		end
end
