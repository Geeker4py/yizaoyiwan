require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it 'shows register page' do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'register new user' do
      post :create, {
        user: {
          username: 'greatghoul',
          email: 'greatghoul@gmail.com',
          password: 'test123.com',
          password_confirmation: 'test123.com'
        }
      }

      expect(response).to redirect_to signin_path
      expect(flash[:notice]).to eq '注册成功'
      expect(assigns(:user).persisted?).to be true
    end
  end
end
