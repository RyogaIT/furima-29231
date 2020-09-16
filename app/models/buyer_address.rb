class BuyerAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_buyer

  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :zipnumber, format: { with: /\A[0-9]+\z/, message: "is invalid. Input full-width characters."}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :buildingname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :phonenumber, format: { with: /\A[0-9]+\z/, message: "is invalid. Input full-width characters."}
end

end
