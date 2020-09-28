require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item = FactoryBot.build(:item_address, item_id: item.id, user_id: user.id)
    end

    it "住所が必須であること" do
      @item.zipnumber = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Zipnumber can't be blank", "Zipnumber is invalid. Input full-width characters.")
    end

    it "住所にハイフンがない場合に購入ができないこと" do
      @item.zipnumber = "12345678"
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("Zipnumber is invalid. Input full-width characters.", "Phonenumber is invalid. Input full-width characters.")
    end

    it "出品値のidが必須であること" do
      @item.deliveryarea_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliveryarea must be other than 0")
    end

    it "市の情報が必須であること" do
      @item.city = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("City can't be blank")
    end

    it "町についての情報が必須であること" do
      @item.address = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号の情報が必須であること" do
      @item.phonenumber = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Phonenumber can't be blank", "Phonenumber is invalid. Input full-width characters.")
    end

    it "電話番号はハイフンを含まず、11桁以内でないと購入できないこと" do
      @item.phonenumber = "090-12345678"
      @item.valid?
      expect(@item.errors.full_messages).to include(["Zipnumber is invalid. Input full-width characters.", "Phonenumber is invalid. Input full-width characters.")
    end

   

    # it "入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(JavaScriptを使用して実装すること)" do
    #   @item.price = 1000
      
    #   @item.valid?
    # end

    #  it"エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）" do
      
    # end

    
  end
end