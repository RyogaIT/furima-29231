class OrdersController < ApplicationController
  def index
   @itemimage = Item.image
   @itemprice = Item.price
  end

  def create
  end

  private

  def order_params
    params.permit(:@itemprice, :token)
  end
  
end
