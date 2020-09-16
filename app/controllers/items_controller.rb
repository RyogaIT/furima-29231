class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    item.update.(item_param)
  end


  def destroy
    if item.valid?
    item.destroy
    redirect_to root_path
    else
      render :show
    end
  end

  def item_param
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :deliverycost_id,
    :deliveryarea_id, :deliverydate_id, :price).merge(user_id: current_user.id)
  end

  def 

  def set_item
    item = Item.find(params[:id]) 
  end

end
