class Item < ApplicationRecord
  validates :product_name , presence: true
  validates :description  , presence: true
  validates :category_id  , presence: true,  numericality: { other_than: 1 }
  validates :condition_id , presence: true,  numericality: { other_than: 1 }
  validates :fee_id       , presence: true,  numericality: { other_than: 1 }
  validates :area_id      , presence: true,  numericality: { other_than: 1 }
  validates :deliverytime_id , presence: true,  numericality: { other_than: 1 }
  validates :price        , presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: "は半角数字で入力してください" }
  validates :image        , presence: true

  belongs_to :user
  # has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :deliverytime
  

  # belongs_to :user
  # has_one :order
end
