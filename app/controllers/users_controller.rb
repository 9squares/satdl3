class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		if @user == current_user
			redirect_to profile_path
		end
		@tasks = @user.tasks
		@activities = PublicActivity::Activity.order("created_at desc")
	end

	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.followed_users
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers
		render "show_follow"
	end

end
