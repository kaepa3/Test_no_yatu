class AddColumUserTasks < ActiveRecord::Migration
  def up
    add_column :user_tasks, :task_id, :integer
    add_column :user_tasks, :user_id, :integer

  end

  def down
    remove_column :user_tasks, :task_name_key, :string
    remove_column :user_tasks, :username_key, :string
  end
end
