class Profile::PasswordsController < ApplicationController
  before_action :require_user

  def show
    drop_title('修改密码')
    
    @user = current_user
  end
end
