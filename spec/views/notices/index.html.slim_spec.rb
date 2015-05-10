require 'rails_helper'

RSpec.describe "notices/index.html.slim", type: :view do
  before do
  end

  it "Display It" do
    render
    expect(rendered).to match /ユーザ追加/
  end
end
