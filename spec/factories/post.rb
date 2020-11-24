FactoryBot.define do
  factory :post do
    
    association :user 
    title                { "タイトル" }
    content              { "テスト" }
    pay_id               { 1 }
    price                { 100 }
    category_id          { 2 }
    genre_id             { 2 }
    type_id              { 2 }
    number1              { "質問" }
    number2              { "質問" }
    number3              { "質問" }
    number4              { "質問" }
    number5              { "質問" }
  end
end