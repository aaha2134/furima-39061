class OrdersController < ApplicationController


  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end



  def new
  @order_address = OrderAddress.new

  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    # @order = Order.find(params[:id])
    # @item = Item.find(@order.item_id)
    # @order_address = OrderAddress.new
  end


  private

  def order_params
    params.require(:order_address).permit(:post_code, :area_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end



end
