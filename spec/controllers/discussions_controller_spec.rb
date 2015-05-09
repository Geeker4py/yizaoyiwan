require 'rails_helper'

RSpec.describe DiscussionsController, :type => :controller do
  let(:user) { create(:user) }
  let(:discussion) { create(:discussion) }

  before(:each) { create_user_session(user) }

  describe 'PATCH /bookmark' do
    it 'toggle bookmark' do
      patch :bookmark, id: discussion.id
      expect(response).to have_http_status(302)
      expect(flash[:success]).to eq '已经添加到收藏'
      expect(discussion.find_votes_for(vote_scope: 'bookmark').count).to eq 1
      expect(user.voted_on?(discussion, vote_scope: 'bookmark')).to be true

      patch :bookmark, id: discussion.id
      expect(response).to have_http_status(302)
      expect(flash[:success]).to eq '已经取消收藏'
      expect(discussion.find_votes_for(vote_scope: 'bookmark').count).to eq 0
      expect(user.voted_on?(discussion, vote_scope: 'bookmark')).to be false
    end
  end
end
