class Comment < ActiveRecord::Base
	include PublicActivity::Common
	
	belongs_to :user
	belongs_to :task
	validates :body, presence: true, length: { maximum: 1000 }
end
