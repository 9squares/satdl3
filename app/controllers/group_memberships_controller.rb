class GroupMembershipsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.find(params[:group_membership][:user_id])
		current_user.join!(@group)
		respond_to do |format|
			format.html { redirect_to @group }
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
end
