class AddPrecursorToTasks < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  		t.remove :user_id
  		t.belongs_to :goal
  		t.references :precursor 
  	end
  end
end
