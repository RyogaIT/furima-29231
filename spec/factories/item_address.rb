FactoryBot.define do
  factory :item_address do
    zipnumber {"123-4567"}
    deliveryarea_id {1}
    city {"横浜"}
    address {"青山"}
    phonenumber {"09012345678"}
    token {"qqqqk"}

    association :user 
    association :item
    
  end
end