class AddPrivateToActivities < ActiveRecord::Migration
  def change
  	change_table :activities do |t|
  		t.string :private
  	end
  end
end
