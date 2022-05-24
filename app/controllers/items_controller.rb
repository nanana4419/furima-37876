class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
    # @items = Item.order("created_at DESC")
    # @items = @index.items.includes(:user)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      #@items = @index.items.includes(:user)
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :situation_id, :delivery_charge_id, :area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
