class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save

      current_cart.cart_items.each do |cart_item|
        p = ProductList.new
        p.order = @order
        p.product_name = cart_item.product.title
        p.product_price = cart_item.product.price
        p.quantity = cart_item.quantity
        p.save
      end
      current_cart.cart_items.destroy_all
      redirect_to order_path(@order.token)
      flash[:notice] = "订单已生成！"
    else
      render "carts/checkout"
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    @order.pay!
    redirect_to :back
    flash[:notice] = "已用支付宝完成付款！"
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    @order.pay!
    redirect_to :back
    flash[:notice] = "已用微信完成付款！"
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :token)
  end

end
