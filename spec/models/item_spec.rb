require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    
    end

    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      binding.pry
      ickname caexpect(@item.errors.full_messages).to include("Nn't be blank")
    end

    it "商品の説明が必須であること" do
      @item.detail = nil
      @item.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "カテゴリーの情報が必須であること" do
      @item.category = 0
      @item.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "商品の状態についての情報が必須であること" do
      @item.status = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Email is invalid")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.deliverycost = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Password can't be blank")
    end

    it "発送元の地域についての情報が必須であること" do
      @item.deliveryareas = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "発送までの日数についての情報が必須であること" do
      @item.deliverydates = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "価格についての情報が必須であること" do
      @item.price = 2000
      @item.valid?
      expect(@item).to be_valid
    end

    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = 100;
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank", "Firstname is invalid. Input full-width characters.", "Lastname can't be blank", "Lastname is invalid. Input full-width characters.")
    end

    it " 販売価格は半角数字のみ入力可能であること" do
      @item.price = "千円"
      @item.valid?
      expect(@item.errors.full_messages).to include("Firstname is invalid. Input full-width characters.", "Lastname is invalid. Input full-width characters.")
    end

    # it "入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(JavaScriptを使用して実装すること)" do
    #   @item.price = 1000
      
    #   @item.valid?
    # end

    #  it"エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）" do
      
    # end

    
  end
end