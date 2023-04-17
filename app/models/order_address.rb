class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :house_number, :building_name, :phone_number,:user_id, :item_id, :token
  with_options presence: true do
    validates :user_id, :item_id, :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :phone_number, numericality: {only_integer: true }, length: { minimum: 10, maximum: 11 }
    validates :municipalities,:house_number
  end



  def save
     order = Order.create(user_id: user_id, item_id:item_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, order:order)
  end


end