class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_quality
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :item_name, presence: true
  validates :content, presence: true
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, presence: true, numericality: { in: 300..9,999,999 }
            format: { with: VALID_PRICE_REGEX,
            message: 'must be entered in half-width numbers'}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_quality_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
end
