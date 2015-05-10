require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:each) do
    Task.delete_all
  end

  it "Task Model Save" do
    record = Task.new
    record.task_name = "fdsa"
    record.save!
    expect(Task.count).to eq(1)
  end

  after(:each) do
    Task.delete_all
  end
end
