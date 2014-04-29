class AddDuedateToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :due_date, :date
  end
end
