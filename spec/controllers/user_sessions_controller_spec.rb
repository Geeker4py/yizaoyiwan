require 'rails_helper'

RSpec.describe UserSessionsController, :type => :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it 'returns signin page' do
      get :new

      expect(response).to have_http_status 200
      expect(response).to render_template(:new)
      expect(assigns(:user_session)).to be_a_new(UserSession)
    end
  end

  describe 'POST #create' do
    it 'authroizes user with right auth info' do
      user_session = {
        email: user.email,
        password: user.password
      }

      post :create, { user_session: user_session }

      expect(response).to redirect_to(root_url)
      expect(flash[:success]).to include '登录成功'
    end

    it 'prevents user with wrong email' do
      user_session = {
        email: 'test#{user.email}',
        password: user.password
      }

      post :create, { user_session: user_session }

      expect(response).to render_template(:new)
      expect(flash[:error]).to include '邮箱或者密码不正确'
    end

    it 'prevents user with wrong password' do
      user_session = {
        email: user.email,
        password: '123.com'
      }

      post :create, { user_session: user_session }

      expect(response).to render_template(:new)
      expect(flash[:error]).to include '邮箱或者密码不正确'
    end

    it 'prevents user with blank auth info' do
      post :create

      expect(response).to render_template(:new)
      expect(flash[:error]).to include '邮箱或者密码不正确'
    end
  end

  describe 'DELETE #destroy' do
    it 'signs out user' do
      user_session = {
        email: user.email,
        password: user.password
      }

      post :create, { user_session: user_session }

      expect(response).to redirect_to(root_url)
      expect(flash[:success]).to include '登录成功'

      delete :destroy
      expect(response).to redirect_to(root_url)
      expect(flash[:notice]).to include '登出成功'
    end
  end
end
