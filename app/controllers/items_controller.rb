class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :set_item, only:[:edit,:show,:update]

  def index
    @items = Item.order("created_at DESC")
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
  
  end


  def edit
    if current_user != @item.user
      redirect_to root_path
  
    end

  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
    else
      render :edit
    end
  end




  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :fee_id, :area_id, :deliverytime_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
  @item = Item.find(params[:id])
  end

end
