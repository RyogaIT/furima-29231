class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 belongs_to :user
 belongs_to :buyer
 has_many :comments
 has_one_attached :image

 belongs_to_active_hash :category
 belongs_to_active_hash :status
 belongs_to_active_hash :deliverycost
 belongs_to_active_hash :deliveryareas
 belongs_to_active_hash :deliverydates

    
  with_options presence: true do
         validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
         validates :detail, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
         validates :category_id, numericality: { other_than: 0}
         validates :status_id, numericality: { other_than: 0}
         validates :deliverycost_id, numericality: { other_than: 0}
         validates :deliveryareas_id, numericality: { other_than: 0}
         validates :deliverydates_id, numericality: { other_than: 0}
         validates :price, numericality: {greater_than: 0, less_than: 100000 }
  end
end
