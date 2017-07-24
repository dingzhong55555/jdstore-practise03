class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = @order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore]感谢您完成此次订单，你的订单的明细如下:#{@order.token}")
  end
end
