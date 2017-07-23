class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to :back
  end

  def deliver
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def return_good
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end

  def cancel_order
    @order = Order.find(params[:id])
    @order.cancel_order!
    redirect_to :back
  end

end
