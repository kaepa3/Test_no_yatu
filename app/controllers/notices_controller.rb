class NoticesController < ApplicationController
  include NoticesHelper


  before_action :require_login, only: [:home]
  #ログイン画面
  def index
    @notice ||= flash.now[:notice]
  end

  #認証
  def verification
    user = login(params[:user_name], params[:password], params[:remember_me])
    if user
      redirect_to '/notices/home', notice: 'Logged in!'
    else
      redirect_to root_url, notice: 'User Name or password was invalid.'
    end
  end

  #Show
  def home
    @notice ||= params[:notice]

    view_context.delete_task(params[:delete]) unless params[:delete].blank?
    user_record = User.where('user_name = ?', current_user.user_name).first
    own_tasks = user_record.tasks

    #データ出力
    @task_inofomations = []
    if own_tasks.count > 0
      own_tasks.each do |one_task|
        @task_inofomations << TaskInfomation.new(one_task.task_name, one_task.users.map{|val| val.user_name})
      end
    end

    respond_to do |format|
      if request.xhr?
        @users = User.all
        format.js
      else
        format.html
      end
    end
  end

  #ユーザ作成画面表示
  def new
    @user = User.new
  end

  #ユーザ作成
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

  #ログアウト
  def logout_to
    remember_me!
    forget_me!
    logout
    redirect_to root_url
  end

  #新しいタスクの追加
  def addtask
    errmsg = ""
    unless params[:taskname].blank? || params[:select_members].blank?
      task_record = Task.find_by('task_name = ?', params[:taskname]) || Task.create(task_name: params[:taskname])
      members = params[:select_members]
      members.each do |member|
        unless task_record.users.exists?(user_name: member)
          user_record = User.find_by('user_name = ?', member)
          user_record.tasks << task_record unless user_record.blank?
        end
      end
    else
      errmsg = "Task Name Blank" if params[:taskname].blank?
      errmsg = "No Member" if params[:select_members].blank?
    end
    redirect_to action: :home, notice: errmsg
  end
end
