FactoryBot.define do
  factory :record_home do
    token          {"tok_abcdefghijk00000000000000000"}
    post_number    {'000-0000'}
    area_id        {'2'}
    city           {'札幌市'}
    house_number   {'中央区1-1-1'}
    bilding_name   { '東京ハイツ' }
    phone_number   {'09055551111'}
  end
end
