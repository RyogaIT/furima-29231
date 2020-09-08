class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    
  with_options presence: true do
         validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
         validates :detail, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
         validates :category_id, numericality: { other_than: 0}
         validates :status_id, numericality: { other_than: 0}
         validates :deliverycost_id, numericality: { other_than: 0}
         validates :deliveryareas_id, numericality: { other_than: 0}
         validates :deliverydates_id, numericality: { other_than: 0}
         validates :price, numericality: {:greaer_than 0, :less_than 100000 }
  end
end
