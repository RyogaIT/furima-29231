require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が必須であること" do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it "カテゴリーの情報が必須であること" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end

    it "商品の状態についての情報が必須であること" do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.deliverycost_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliverycost must be other than 0")
    end

    it "発送元の地域についての情報が必須であること" do
      @item.deliveryarea_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliveryarea must be other than 0")
    end

    it "発送までの日数についての情報が必須であること" do
      @item.deliverydate_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliverydate must be other than 0")
    end

    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end

    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it " 販売価格は半角数字のみ入力可能であること" do
      @item.price = "千円"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    # it "入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(JavaScriptを使用して実装すること)" do
    #   @item.price = 1000
      
    #   @item.valid?
    # end

    #  it"エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）" do
      
    # end

    
  end
end