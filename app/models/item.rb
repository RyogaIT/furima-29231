class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
#  belongs_to :buyer
#  has_many :comments
  has_one_attached :image


  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deliverycost
  belongs_to_active_hash :deliveryarea
  belongs_to_active_hash :deliverydate


    
  with_options presence: true do
        validates :name
        # , format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
         validates :detail
        #  , format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
         validates :category_id, numericality: { other_than: 0}
         validates :status_id, numericality: { other_than: 0}
         validates :deliverycost_id, numericality: { other_than: 0}
         validates :deliveryarea_id, numericality: { other_than: 0}
         validates :deliverydate_id, numericality: { other_than: 0}
         validates :price, numericality: {greater_than: 300, less_than: 9999999 }
  end
end
