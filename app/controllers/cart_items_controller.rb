class CartItemsController < ApplicationController

  def destroy
    @cart_item = current_cart.cart_items.find_by_product_id(params[:id])
    @cart_item.destroy
    @product = @cart_item.product
    redirect_to :back
    flash[:warning] = "已删除商品#{@product.title}！"
  end

  def update
    @cart_item = current_cart.cart_items.find_by_product_id(params[:id])
    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
     flash[:notice] = "成功变更数量"
   else
     flash[:warning] = "数量不足以加入购物车"
   end
    redirect_to :back
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
