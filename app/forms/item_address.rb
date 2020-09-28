class ItemAddress

  include ActiveModel::Model
  attr_accessor :zipnumber, :deliveryarea_id, :city, :address, :buildingname, :phonenumber, :token, :user_id, :item_id

  with_options presence: true do
    validates :zipnumber, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input full-width characters."}
    validates :deliveryarea_id, numericality: { other_than: 0}
    validates :city
    validates :address
    # validates :buildingname
    validates :phonenumber, format: { with: /\A[0-9]+\z/, message: "is invalid. Input full-width characters."}
end

# belongs_to_active_hash :deliveryarea


def save
  # ユーザーの情報を保存し、「buyer_address」という変数に入れている
  
  itembuyer = ItemBuyer.create(user_id: user_id, item_id: item_id)
  BuyerAddress.create(zipnumber: zipnumber, deliveryarea_id: deliveryarea_id, city: city, address: address, buildingname: buildingname, phonenumber: phonenumber, item_buyer_id: itembuyer.id)
  # 商品と購入者の情報を保存
  
end

end