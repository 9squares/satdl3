class Group < ActiveRecord::Base
	has_many :group_memberships
	has_many :users, through: :group_memberships

	def member?(user)
		group_memberships.find_by(user_id: user.id)
	end

	def join!(user)
		group_memberships.create!(user_id: user.id)
	end

	def unjoin!(user)
		group_memberships.find_by(user_id: user.id).destroy
	end
end
