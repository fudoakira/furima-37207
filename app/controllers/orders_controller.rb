class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.permit(:post_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :content, :price, :category_id, :item_quality_id, :shipping_fee_burden_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_22bda75c30e27cc10fca3d36"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
