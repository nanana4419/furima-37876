FactoryBot.define do
  factory :item do
    item_name {'test'}
    explanation {'tuyoi'}
    category_id {2}
    situation_id {2}
    delivery_charge_id {2}
    area_id {2}
    shipping_day_id {2}
    price {'1000'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
