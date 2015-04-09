class NoticesController < ApplicationController
  def index
    @notice ||= flash.now[:notice]
  end

  def verification
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, notice: 'Logged in!'
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
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: 'Signed up!'
    else
      render :new
    end
  end

end
