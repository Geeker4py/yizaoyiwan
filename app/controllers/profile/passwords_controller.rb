class Profile::PasswordsController < ApplicationController
  before_action :require_user

  def show
    drop_title('修改密码')
    
    @user = current_user
  end

  def update
    @user = current_user
    @user.group_validates(:update_password)
    
    respond_to do |format|
      if @user.update_attributes(password_params)
        format.html { redirect_to profile_path, notice: '密码更新成功' }
      else
        logger.error "Errors: #{@user.errors.messages}"
        format.html { render action: :show }
      end
    end
  end

  private

  def password_params
    params.require(:user).permit(
      :old_password, :password, :password_confirmation
    )
  end
end
