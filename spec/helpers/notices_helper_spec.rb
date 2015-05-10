require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the NoticesHelper. For example:
#
# describe NoticesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe NoticesHelper, type: :helper do
  it "Can delete_task?" do
    task_name = 'hoge'
    before_count = Task.where('task_name =?', task_name).count

    record = Task.new
    record.task_name = task_name
    record.save!

    delete_task task_name

    after_count = Task.where('task_name =?', task_name).count
    expect(before_count).to eq(after_count)
  end
end

