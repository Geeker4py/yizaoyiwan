require 'rails_helper'

RSpec.describe Profile::PasswordsController, type: :controller do
  let(:user) { create(:user) }

  before(:each) { create_user_session(user) }

  describe 'GET #show' do
    it 'shows edit password page' do
      get :show

      expect(response).to be_success
      expect(response).to render_template(:show)
      expect(assigns(:user)).to eq user
    end
  end

  describe 'PATCH #update' do
    it 'updates password' do
      patch :update, {
        user: {
          old_password: 'test123.com',
          password: 'oktest123.com',
          password_confirmation: 'oktest123.com'
        }
      }

      expect(assigns(:user).errors.messages).to be_empty
      expect(response).to redirect_to profile_path
      expect(flash[:notice]).to eq '密码更新成功'
      expect(user.reload.valid_password?('oktest123.com', true)).to be true
    end

    it 'checks old password' do
      patch :update, {
        user: {
          old_password: 'test1231.com',
          password: 'oktest123.com',
          password_confirmation: 'oktest123.com'
        }
      }

      expect(assigns(:user).errors).to have_key(:old_password)
      expect(response).to render_template(:show)
    end
  end
end
