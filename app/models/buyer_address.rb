class BuyerAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_buyer

  # belongs_to_active_hash :deliveryarea

end
