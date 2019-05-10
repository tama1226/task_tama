class AddColumnToTasksPriority < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :string, default: "低"
  end
end
