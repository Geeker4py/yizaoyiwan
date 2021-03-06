class UserSessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      flash[:success] = '登录成功'
      redirect_to root_url
    else
      flash[:error] = '邮箱或者密码不正确'
      redirect_to signin_path
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = '登出成功'
    
    redirect_to root_url
  end
end
