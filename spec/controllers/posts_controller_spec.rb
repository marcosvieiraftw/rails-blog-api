require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "trying to access without a token GET #show" do
    before do
      get :show, params: { id: post.id }
    end

    let(:post) { Post.create(user_id: 1, title: 'Hello World', description: 'Description') }

    it "returns unauthorized http status" do
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
