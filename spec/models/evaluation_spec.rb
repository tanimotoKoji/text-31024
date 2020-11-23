require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  describe '#create' do
    before do
      @poster = FactoryBot.create(:user)
      @post = FactoryBot.create(:post)
      @pointer = FactoryBot.create(:user)
      @evaluation = FactoryBot.build(:evaluation, user_id:@poster.id, post_id:@post.id, user_id:@pointer.id)
      
    end

  describe '投稿データの保存' do
    context "投稿データが保存できる場合"
      it "rateとcommentとfirst〜fifth_idがあれば登録できる亊" do
      expect(@evaluation).to be_valid
      end

    context "投稿データが保存できない場合"
      
      it "rateが空では保存できない" do
      @evaluation.rate = nil
      @evaluation.valid?
      expect(@evaluation.errors.full_messages).to include("総合評価を入力してください")  
      end

      it "commentが空では保存できない事" do
        @evaluation.comment = nil
        @evaluation.valid?
        expect(@evaluation.errors.full_messages).to include("コメントを入力してください")
      end

      it "first_idが未選択では保存できない" do
        @evaluation.first_id = nil
        @evaluation.valid?
        expect(@evaluation.errors.full_messages).to include("質問①を入力してください")
      end

      it "second_idが未選択では保存できない" do
        @evaluation.second_id = nil
        @evaluation.valid?
        expect(@evaluation.errors.full_messages).to include("質問②を入力してください")
      end

      it "third_idが未選択では保存できない" do
        @evaluation.third_id = nil
        @evaluation.valid?
        expect(@evaluation.errors.full_messages).to include("質問③を入力してください")
      end

      it "fourth_idが未選択では保存できない" do
        @evaluation.fourth_id = nil
        @evaluation.valid?
        expect(@evaluation.errors.full_messages).to include("質問④を入力してください")
      end

      it "fifth_idが未選択では保存できない" do
        @evaluation.fifth_id = nil
        @evaluation.valid?
        expect(@evaluation.errors.full_messages).to include("質問⑤を入力してください")
      end
  
    end
  end
end
