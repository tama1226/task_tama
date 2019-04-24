class AddcolumnTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :end, :date
  end
end
