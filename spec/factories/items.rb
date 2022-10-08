FactoryBot.define do
  factory :item do
      name              { Faker::Commerce }
      price             { Faker::Number.between(from: 300, to:9_999_999) }
      item_text         { Faker::Lorem }
      category_id          {2}
      condition_id         {2}
      delivery_charge_id   {2}
      sender_id            {2}
      number_day_id        {2}

      association :user 

       after(:build) do |item|
         item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
       end
  end
end
