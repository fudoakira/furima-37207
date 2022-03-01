class ShippingAddress < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "例）123-4567"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\d{10,11}/}, length: {maximum: 11}
end
