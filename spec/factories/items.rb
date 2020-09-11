FactoryBot.define do
  factory :item do
    name {"テスト商品"}
    detail{"テスト用の商品です。"}
    category_id {1}
    status_id {1}
    deliverycost_id {1}
    deliveryarea_id {1}
    deliverydate_id {1}
    price {3000}
    association :user 
  end
end