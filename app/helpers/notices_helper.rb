
module NoticesHelper

  def delete_task(name)
      task_record = Task.where('task_name = ?', name).first
      task_record.destroy unless task_record.blank?
  end

end

class TaskInfomation
  attr_accessor :task_name, :task_members
  def initialize (task_name, members)
    @task_name = task_name
    @task_members = members
  end
end

