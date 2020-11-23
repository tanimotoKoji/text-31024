FactoryBot.define do

  password = Faker::Internet.password(min_length: 7)

  
  factory :user do
    nickname             { "koji" }
    email                { Faker::Internet.email }
    password             { password }
    password_confirmation { password }
    profile              { "谷本です"}
    last_name            { "たにもと" }
    first_name           { "こうじ" }
    last_name_kana       { "タニモト" }
    first_name_kana      { "コウジ" }
    occupation_id        { 2 }
    gender_id            { 2 }
    age_id               { 2 }
   end
end