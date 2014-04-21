class Task < ActiveRecord::Base
	include PublicActivity::Common

	belongs_to :user
	validates :user_id, presence: true
	has_many :comments, dependent: :destroy
end
