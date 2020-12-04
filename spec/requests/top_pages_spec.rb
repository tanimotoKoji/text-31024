require 'rails_helper'
RSpec.describe "TopPages", type: :request do

  before do
    @post = FactoryBot.create(:post)
  end

  before do
    @user = FactoryBot.create(:user)
  end
  
    describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
  end
  
    describe "GET #show" do
      it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get top_pages_path
        expect(response.status).to eq 200
      end
    end 
end
