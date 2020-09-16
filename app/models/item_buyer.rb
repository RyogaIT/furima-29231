class ItemBuyer < ApplicationRecord
  has_many :users
  has_many :items
  has_one :buyer_address
end
