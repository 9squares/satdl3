class Task < ActiveRecord::Base
	include PublicActivity::Common

	has_many :subtask, class_name: "Task",
					   foreign_key: "precursor_id"
	belongs_to :precursor, class_name: "Task"

	belongs_to :goal
	validates :title, presence: true, length: { maximum: 500 }
	has_many :comments, dependent: :destroy
end
