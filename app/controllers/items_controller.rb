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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if item = Item.find(params[:id])
       item.update(item_params)
       redirect_to root_path
    else
      render :edit
    end
  end

  

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :deliverycost_id,
    :deliveryarea_id, :deliverydate_id, :price).merge(user_id: current_user.id)
  end

end
