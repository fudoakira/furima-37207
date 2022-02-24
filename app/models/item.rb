class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_quality
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            message: "can't be blank" }
  validates :item_name, presence: true
  validates :content, presence: true
  validates :price, presence: true,
            format: { with: /\A[0-9]+\z/,
            message: 'must be entered in half-width numbers'},
            numericality: { in: 300..9999999,
            message: 'must be entered between ¥300~¥9,999,999' }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_quality_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
end
