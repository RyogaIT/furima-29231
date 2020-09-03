class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = item.new
  end

  def create
    @item = item.new(item_param)
    if @item.save
      redirect_to item_path
    else
      render :new
    end
  end

  def item_param
    params.require(:item).permit(:name, :detail, :category, :status, :deliverycost,
    :deliveryareas, :deliverydates, :price, :user, :buyer)

end
