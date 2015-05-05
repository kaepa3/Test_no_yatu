class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: 'No Match'
  validates_presence_of :user_name, :password
  validates_uniqueness_of :user_name

  ##多対多
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
end
