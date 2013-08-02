class OneMoreRenaming < ActiveRecord::Migration
  def change
  	rename_column(:tasks, :place, :priority)
  end
end
