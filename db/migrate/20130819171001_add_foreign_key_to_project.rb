class AddForeignKeyToProject < ActiveRecord::Migration
  def change
  	change_table :projects do |t|
      t.belongs_to :user
    end
  end
end
