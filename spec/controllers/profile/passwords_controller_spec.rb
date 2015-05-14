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
end
