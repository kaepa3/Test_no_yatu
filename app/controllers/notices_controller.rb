class NoticesController < ApplicationController

  before_action :require_login, only: [:home]
  def index
    @notice ||= flash.now[:notice]
  end

  def verification
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to '/notices/home', notice: 'Logged in!'
    else
      redirect_to root_url, notice: 'Email or password was invalid.'
    end
  end

  def home

  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user)
              .permit(:email, :password, :password_confirmation)
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Signed up!'
    else
      render :new
    end
  end

  def logout_to
    logout
    redirect_to root_url
  end
end
