class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.string :username_key
      t.string :task_name_key

      t.timestamps
    end
  end
end
