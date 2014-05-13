class Goal < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	has_many :tasks
end
