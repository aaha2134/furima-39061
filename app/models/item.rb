class Item < ApplicationRecord
  validates :product_name , presence: true
  validates :description  , presence: true
  validates :category_id  , presence: true,  numericality: { other_than: 1 }
  validates :condition_id , presence: true
  validates :fee_id       , presence: true
  validates :area_id      , presence: true
  validates :deliverytime_id , presence: true
  validates :price        , presence: true
  validates :user         , presence: true
  
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :user_id, numericality: { other_than: 1 } 
end
