FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    
    post_code { '123-4567' }
    area_id { 3 }
    municipalities { '渋谷区' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number {'00000000000'}
    token {'00000adfs-dfd'}
    association :order
  end
end
