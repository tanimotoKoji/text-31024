require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname、email、password、password_confirmation、last_name、first_name、
        last_name_kana、first_name_kana、age_id、occupation_id、gender_idが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    
    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "emailが重複する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
  

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    
    it "passwordが６文字以上、半角英数字の組み合わせであれば登録できること" do
      @user.password = "tanimoto1"
      @user.password_confirmation = "tanimoto1"
      expect(@user).to be_valid
    end

    it "passwordが数字のみの場合は登録できないこと" do
      @user.password = "1234567"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "passwordが英字のみの場合は登録できないこと" do
      @user.password = "abcdefg"
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end


    it "passwordが５文字以内であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "password_confirmationがpasswordと一致していないと登録できないこと" do
      @user.password = "tanimoto1"
      @user.password_confirmation = "tanimoto2"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
      
    it "last_nameが空だと登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ラストネームを入力してください")
    end

    it "first_nameが空だと登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ファーストネームを入力してください")
    end

     it "last_nameが半角英数字だと登録できないこと" do
      @user.last_name = "ssssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("ラストネームは不正な値です")
     end 
    
     it "last_nameが数字だと登録できないこと" do
      @user.last_name = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("ラストネームは不正な値です")
     end 

     it "first_nameが半角英字だと登録できないこと" do
      @user.first_name = "ssssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("ファーストネームは不正な値です")
     end 

     it "first_nameが数字だと登録できないこと" do
      @user.first_name = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("ファーストネームは不正な値です")
     end 
    
     it "last_name_kanaが空だと登録できないこと" do
       @user.last_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("ラストネーム読みを入力してください")
     end

     it "first_name_kanaが空だと登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ファーストネーム読みを入力してください")
     end

     it "last_name_kanaが半角英字だと登録できないこと" do
      @user.last_name_kana = "sssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("ラストネーム読みは不正な値です")
    end

    it "last_name_kanaが数字だと登録できないこと" do
      @user.last_name_kana = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("ラストネーム読みは不正な値です")
    end

    it "last_name_kanaが漢字だと登録できないこと" do
      @user.last_name_kana = "谷本光司"
      @user.valid?
      expect(@user.errors.full_messages).to include("ラストネーム読みは不正な値です")
    end

    it "first_name_kanaが半角英字だと登録できないこと" do
      @user.first_name_kana = "sssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("ファーストネーム読みは不正な値です")
    end
    
    it "first_name_kanaが数字だと登録できないこと" do
      @user.first_name_kana = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("ファーストネーム読みは不正な値です")
    end

    it "first_name_kanaが漢字だと登録できないこと" do
      @user.first_name_kana = "谷本光司"
      @user.valid?
      expect(@user.errors.full_messages).to include("ファーストネーム読みは不正な値です")
    end

    it "last_nameとfirst_nameが全角文字だと登録できること" do
      @user.last_name = "たにもと"
      @user.first_name = "こうじ"
      expect(@user).to be_valid
    end

    it "last_name_kanaとfirst_name_kanaがカタカナだと登録できること" do
      @user.last_name = "タニモト"
      @user.first_name = "コウジ"
      expect(@user).to be_valid
    end

    it "gender_idが空だと登録できないこと" do
      @user.gender_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("性別を入力してください")
    end

    it "age_idが1だと登録できないこと" do
      @user.age_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("年代--以外を選択してください")
    end

    it "occupation_idが1だと登録できないこと" do
      @user.occupation_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("職種--以外を選択してください")
    end

  end
end

