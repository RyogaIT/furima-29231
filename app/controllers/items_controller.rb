class ItemsController < ApplicationController
  
  def index
    # @items = Item.include(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_param)
    if @item.save
      redirect_to item_path
    else
      render :new
    end
  end

  def item_param
    params.require(:item).permit(:name, :detail, :category, :status, :deliverycost,
    :deliveryareas, :deliverydates, :price).merge(user_id: current_user.id)
  end

end
