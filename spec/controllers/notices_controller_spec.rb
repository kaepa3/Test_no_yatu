require 'rails_helper'

RSpec.describe NoticesController, type: :controller do
  before do
    #ログイン情報の作成
    User.create(user_name: "田中", email: "tanaka@test.co.jp", password: "hoge")
    @user = User.first
    allow(controller)
      .to receive(:current_user)
      .and_return(@user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end
end
