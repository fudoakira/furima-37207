FactoryBot.define do
  factory :order_shipping_address do
    token {ENV["PAYJP_SECRET_KEY"]}
    post_code {"123-4567"}
    prefecture_id {rand(2..48)}
    municipalities {Faker::Address.city}
    address {Faker::Address.street_address}
    building {Faker::Address.secondary_address}
    phone_number {"0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}"}
  end
end
