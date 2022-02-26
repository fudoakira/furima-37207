class ShippingAddress < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :post_code, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
