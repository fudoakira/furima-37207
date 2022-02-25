FactoryBot.define do
  factory :item do
    item_name {"Hoge"}
    content {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {rand(2..11)}
    item_quality_id {rand(2..7)}
    shipping_fee_burden_id {rand(2..3)}
    prefecture_id {rand(2..48)}
    days_to_ship_id {rand(2..4)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
