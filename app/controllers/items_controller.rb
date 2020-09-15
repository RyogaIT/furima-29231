class ItemsController < ApplicationController
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    if user_signed_in?
     @item = Item.new
    else redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_param)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  

  def item_param
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :deliverycost_id,
    :deliveryarea_id, :deliverydate_id, :price).merge(user_id: current_user.id)
  end

end
