class OrderMailer < ApplicationMailer

  def notify_order_placed(order)
    @order = order
    @user = @order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "【JDstore】感谢您在完成订单, 您的订单明细如下:#{@order.token}")
  end

  def apply_cancel(order)
    @order = order
    @user = @order.user
    @product_lists = @order.product_lists

    mail(to: "dingzhong55555@gmail.com", subject: "【JDstore】用户#{@user.email}取消订单, 订单明细如下:#{@order.token}")
  end

end
