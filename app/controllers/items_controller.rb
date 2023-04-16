class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :set_item, only:[:edit,:show,:update,:destroy]
  before_action :move_to_index, only:[:edit,:destroy]

  def index
    @order = Order.all
    @items = Item.order("created_at DESC")
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save

      redirect_to root_path

    else
      render :new

    end
  end

  def show
  # @orders = @item.orders.includes(:user)
  end


  def edit
    

  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
    else
      render :edit
    end
  end



  def destroy
  set_item
  @item.destroy
  redirect_to root_path
end


  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :fee_id, :area_id, :deliverytime_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
  @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user != @item.user
      redirect_to root_path
    end
end

end
