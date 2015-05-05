class NoticesController < ApplicationController

  before_action :require_login, only: [:home]
  def index
    @notice ||= flash.now[:notice]
  end

  def verification
    user = login(params[:user_name], params[:password], params[:remember_me])
    if user
      redirect_to '/notices/home', notice: 'Logged in!'
    else
      redirect_to root_url, notice: 'User Name or password was invalid.'
    end
  end

  def home
    @input_form = "silent"
    @users = User.all
    respond_to do |format|
      if request.xhr?
        @input_form = "do ajax"
        format.js
      else
        format.html
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user)
              .permit(:email, :user_name, :password, :password_confirmation)
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

  def addtask
  end

end
