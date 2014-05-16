class GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
		@groups = Group.all
		@group = Group.new(group_params)
		@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_users)
	end

	def create
		@user = current_user
		@group = Group.new(group_params)
		if @group.save
			#@goal.create_activity :create, owner: current_user
			@user.group_memberships.create(group_id: @group.id)
			flash[:success] = "Task created!"
			redirect_to group_path(@group)
		else
			render 'static_pages/home'
		end
	end

	def show
		@group = Group.find(params[:id])
		@users = @group.users
		#@tasks = @users.tasks
		@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_users)
	end

	def update
	end

	def destroy
	end

	

	private

		def group_params
			params.require(:group).permit(:title) if params[:group]
		end
end

