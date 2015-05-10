require 'rails_helper'

RSpec.describe "notices/home.html.slim", type: :view do
  before do
  end

  it "Display It" do
    @task_inofomations =[]
    render
    expect(rendered).to match /btn-default/
  end

end
