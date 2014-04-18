class DynamicPagesController < ApplicationController
	before_action :authenticate_user!

	def profile
		@user = current_user
		@tasks = @user.tasks.reject(&:new_record?)
		@task = @user.tasks.build if user_signed_in?
		@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_users)
	end

	def index
		@users = User.all
	end

end
