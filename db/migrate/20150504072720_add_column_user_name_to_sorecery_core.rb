class AddColumnUserNameToSoreceryCore < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string, :null => false, :default => "test"
  end
end
