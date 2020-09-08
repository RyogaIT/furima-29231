FactoryBot.define do
  factory :item do
    name {"テスト商品"}
    detail{"テスト用の商品です。"}
    category {1}
    status {1}
    deliverycost {1}
    deliveryareas {1}
    deliverydates {1}
    price {3000}
  end
end