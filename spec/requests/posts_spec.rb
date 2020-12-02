require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before do
    @post = FactoryBot.create(:post)
    @user = FactoryBot.create(:user)
    @buy = PostOrder.create(:post_order, post_id:@post.id, user_id:@user.id, price:@post.price)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get posts_path
      expect(response.status).to eq 200
    end
  end
end
