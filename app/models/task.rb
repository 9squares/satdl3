class Task < ActiveRecord::Base
	include PublicActivity::Common

	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 500 }
	has_many :comments, dependent: :destroy
end
