class AddColumnToTasksPriority < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :integer, default: "高"
  end
end
