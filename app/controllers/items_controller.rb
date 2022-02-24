class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :content, :price, :category_id, :item_quality_id, :shipping_fee_burden_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
