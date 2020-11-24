FactoryBot.define do
  factory :evaluation do

    association :user 
    association :post
    rate                 { 5 }
    comment              { "テスト" }
    first_id             { 1 }
    second_id            { 1 }
    third_id             { 1 }
    fourth_id            { 1 }
    fifth_id             { 1 }
    
  end
end
