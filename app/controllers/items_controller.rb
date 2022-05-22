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
    params.require(:item).permit(:item_name, :explanation, :user, :category_id, :situation_id, :delivery_charge_id, :area_id, :shipping_day_id, :price)
  end

end
