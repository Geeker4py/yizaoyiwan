require 'rails_helper'

RSpec.describe Profile::ProfileController, type: :controller do
  let(:user) { create(:user) }

  before(:each) { create_user_session(user) }

  describe 'GET #index' do
    it 'shows profile page' do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(assigns(:user)).to eq user
    end
  end
end
