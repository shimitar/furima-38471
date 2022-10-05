FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                 {Faker::Name.initials(number: 2)}
    email                    {Faker::Internet.free_email}
    password                 {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation    {password}
    kanji_lastname           { person.first.kanji }
    kanji_firstname          { person.last.kanji }
    katakana_lastname        { person.first.katakana }
    katakana_firstname       { person.last.katakana }
    birthday                 { Faker::Date.backward }    
  end
end