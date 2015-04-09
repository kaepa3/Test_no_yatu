class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: 'No Match'
  validates_presence_of :email, :password
  validates_uniqueness_of :email
end
