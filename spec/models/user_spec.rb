require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    User.delete_all
  end

  it "User Model Save" do
    record = User.new
    record.user_name = "fdsa"
    record.password = "fdsa"
    record.email = "dsaa"

    record.save!
    expect(User.count).to eq(1)
  end

  it "User Model Value Empty" do
    record = User.new
    flg = nil
    begin
      record.save!
    rescue Exception => e
      flg = "dddd =>#{e.message}"
    end
    expect(flg).not_to eq(nil)
  end

  after(:each) do
    User.delete_all
  end
end
