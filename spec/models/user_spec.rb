require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    
    end

    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは@を含む必要があること" do
      @user.email = "testgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Emsil should include @")
    end
    it " パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは6文字以上であること" do
      @user.password = "test"
      @user.password_confirmation = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password should be 6 words")
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password should be number and words")
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password = "test12"
      @user.password_confirmation = "test12"
      expect(@user).to be_valid
    end

    # it "新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）" do

    # end

    it "ユーザー本名が、名字と名前がそれぞれ必須であること" do
      @user.firstname = nil
      @user.lastname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First and Last name can't be blank")
    end

    it " ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.firstname = testfirst
      @user.lastname = testlast
      @user.valid?
      expect(@user.errors.full_messages).to include("First and Last name can't be blank")
    end

    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
      @user.firstnamekana = nil
      @user.lastnamekana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First and Last names are necessary")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.firstnamekana = 太郎
      @user.lastnamekana = 山田
      @user.valid?
      expect(@user.errors.full_messages).to include("First and Last name should be kana")
    end

    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end