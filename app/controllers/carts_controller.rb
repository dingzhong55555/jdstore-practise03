class CartsController < ApplicationController

  def index
    @cart_items = current_cart.cart_items
  end

  def clean
    current_cart.cart_items.destroy_all
    redirect_to :back
    flash[:warning] = "购物车已清空！"
  end

end
