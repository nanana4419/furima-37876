class ItemsController < ApplicationController
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :user, :category_id, :situation_id, :delivery_charge_id, :area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
