class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = ItemAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = ItemAddress.new(order_params)
    # binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:item_address).permit(:zipnumber, :deliveryarea_id, :city, :address, :buildingname, :phonenumber).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_7f6f48a0ad2c29cced5acba1"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
  
end
