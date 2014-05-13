class GroupsController < ApplicationController
	before_action :authenticate_user!

	def create
	end

	def show
		@goal = Goal.find_by(id: params[:id])
	end

	def update
	end

	def destroy
	end

	private

		def goal_params
			params.require(:group).permit(:title)
		end
end

