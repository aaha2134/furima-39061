class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    
    elsif current_user == @item.user
      redirect_to root_path
    end
end


  def new
  @order_address = OrderAddress.new

  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @order = Order.find(params[:id])
    # @item = Item.find(@order.item_id)
    # @order_address = OrderAddress.new
  end


  private

  def order_params
    params.require(:order_address).permit(:price, :post_code, :area_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
  amount: @item.price,
  card: order_params[:token],
  currency: 'jpy'
)
end

end
