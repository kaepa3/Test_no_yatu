require 'rails_helper'

RSpec.describe UserTask, type: :model do
  before(:each) do
    Task.delete_all
    User.delete_all
  end

  it "Check Relation" do
    user_rec = User.new(user_name: "田中", email: "tanaka@test.co.jp", password: "hoge")
    task_rec = Task.new(task_name: "ねる")
    task_rec.users << user_rec
    expect(UserTask.count).not_to eq(1)
  end

  after(:each) do
    Task.delete_all
    User.delete_all
  end


end
