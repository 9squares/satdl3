class Goal < ActiveRecord::Base
	include PublicActivity::Common

	belongs_to :user
	validates :user_id, presence: true
	has_many :tasks, dependent: :destroy
	validates :title, presence: true, length: { maximum: 500 }
end
