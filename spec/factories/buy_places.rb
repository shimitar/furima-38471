FactoryBot.define do
  factory :buy_place do
     user_id { Faker::Number.non_zero_digit }
     item_id { Faker::Number.non_zero_digit }
     post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
      sender_id { 2 }
      street { Faker::Address.city }
      address { Faker::Address.street_address }
      building_name { '東京ハイツ' } 
      phone {  Faker::Number.decimal_part(digits: 11) }
      token {"tok_abcdefghijk00000000000000000"}
  end
end
