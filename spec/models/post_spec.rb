require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.build(:post, user_id:@user.id)
    end

  describe '投稿データの保存' do
    context "投稿データが保存できる場合"
      it "titleとcontentとcategory_idとgenre_idとtype_idとpay_idとpriceとnumber1〜5があれば登録できる亊" do
      expect(@post).to be_valid
      end

      it "priceが半角数字なら登録できる事" do
      @post.price = 999999
      expect(@post).to be_valid
      end



    context "投稿データが保存できない場合"
      
      it "titleが空では保存できない" do
      @post.title = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("タイトルを入力してください")  
      end

      it "contentが空では保存できない事" do
      @post.content = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("投稿内容を入力してください")  
      end

      it "category_idが1では保存できない事" do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("カテゴリー①--以外を選択してください")
      end

      it "genre_idが1では保存できない" do
        @post.genre_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("カテゴリー②--以外を選択してください")
      end

      it "type_idが1では保存できない" do
        @post.type_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("カテゴリー③--以外を選択してください")
      end

      it "pay_idが未選択では保存できない" do
        @post.pay_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("販売区分を入力してください")
      end

      it "priceが空では保存できない" do
        @post.price = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("価格を入力してください")
      end

      it "number1が空だと保存できない" do
        @post.number1 = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("質問①を入力してください")
      end

      it "number2が空だと保存できない" do
        @post.number2 = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("質問②を入力してください")
      end

      it "number3が空だと保存できない" do
        @post.number3 = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("質問③を入力してください")
      end

      it "number4が空だと保存できない" do
        @post.number4 = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("質問④を入力してください")
      end

      it "number5が空だと保存できない" do
        @post.number5 = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("質問⑤を入力してください")
      end


      
    end
  end
end
