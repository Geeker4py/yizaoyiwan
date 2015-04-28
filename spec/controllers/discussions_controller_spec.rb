require 'rails_helper'

RSpec.describe DiscussionsController, :type => :controller do
  let(:user) { create(:user, role: :user) }
  let(:discussion) { create(:discussion) }

  before(:each) do
    sign_in(user)
  end

  describe 'PATCH /bookmark' do
    it 'toggle bookmark' do
      patch :bookmark, id: discussion.id
      expect(response).to have_http_status(302)
      expect(discussion.find_votes_for(vote_scope: 'bookmark').count).to eq 1
      expect(user.voted_on?(discussion, vote_scope: 'bookmark')).to be true

      patch :bookmark, id: discussion.id
      expect(response).to have_http_status(302)
      expect(discussion.find_votes_for(vote_scope: 'bookmark').count).to eq 0
      expect(user.voted_on?(discussion, vote_scope: 'bookmark')).to be false
    end
  end
end
