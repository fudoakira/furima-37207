class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :user_id, :item_id, :token

  validates :post_code, presence: true,
            format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "must be entered in half-width character string (example:123-4567)"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true,
            format: {with: /\A\d{10,11}\z/, message: "must be entered in 10-11 half-width numbers (example:09012345678)"}
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end