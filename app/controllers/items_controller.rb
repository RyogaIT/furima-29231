class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
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
