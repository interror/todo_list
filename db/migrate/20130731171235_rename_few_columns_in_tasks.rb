class RenameFewColumnsInTasks < ActiveRecord::Migration
  def change
  	rename_column(:tasks, :done, :is_done)
  	rename_column(:tasks, :until, :deadline)
  end
end
