class DynamicPagesController < ApplicationController
	before_action :authenticate_user!

	def profile
		@user = current_user
		@tasks = @user.tasks.reject(&:new_record?)
		@task = @user.tasks.build if user_signed_in?
	end

	def index
		@users = User.all
	end
end
