FactoryBot.define do
  factory :user do
    nickname              {'abe'}
    email                 {Faker::Internet.free_email}
    password              {'a11111'}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'翔'}
    last_name_kana        {'サトウ'}
    first_name_kana       {'ショウ'}
    birthday              {'2000-1-1'}
  end
end