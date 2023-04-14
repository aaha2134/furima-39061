class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :house_number, :building_name, :phone_number,:order_id,:user_id, :item_id
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates  :area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities,:house_number,:phone_number, presence:true
  end




  def save
    # 購入情報を保存し、変数orderに代入する
     order = Order.create(user_id: user_id, item_id:item_id)
    # 住所を保存する
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, order:order)
  end


end