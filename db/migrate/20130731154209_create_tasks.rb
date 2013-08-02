class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :until
      t.boolean :done
      t.decimal :place

      t.timestamps
    end
  end
end
