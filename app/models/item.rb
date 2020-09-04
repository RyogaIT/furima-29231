class Item < ApplicationRecord
  def change
    create_table :articles do |t|
      t.string           :name                 ,null: false
      t.text             :detail               ,null: false
      t.category         :category_id          ,null: false
      t.status           :status_id            ,null: false
      t.deliverycost     :deliverycost_id      ,null: false
      t.deliveryareas    :deliveryareas_id     ,null: false
      t.deliverydates    :deliverydates_id     ,null: false
      t.price            :price_id             ,null: false
      
      belongs_to :user
      belongs_to :buyer
      has_many :comments
end
