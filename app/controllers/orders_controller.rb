class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :url_profibit

  def index
    @order = ItemAddress.new
  end

  def create
    @order = ItemAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:item_address).permit(:zipnumber, :deliveryarea_id, :city, :address, :buildingname, :phonenumber).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def url_profibit
    @item = Item.find(params[:item_id])
    if @item.item_buyer.present? || @item.user_id == current_user.id
       redirect_to root_path
    end
  end
  
end
