FactoryBot.define do
  factory :item_buyer do
    association :user
    association :item

    token :qqqqk
  end
end
