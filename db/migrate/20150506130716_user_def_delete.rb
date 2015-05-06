class UserDefDelete < ActiveRecord::Migration
  def self.up
    change_column :users, :user_name, :string, :default => nil
  end

  def self.down
    change_column :users, :user_name, :string, :default => "test"
  end
end
