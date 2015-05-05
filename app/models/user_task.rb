class UserTask < ActiveRecord::Base

  has_many :user
  has_many :task

end
