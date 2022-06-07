class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index1, except: [:index, :show, :new, :create, :update]
  before_action :move_to_index2, except: [:index, :show, :new, :create, :update]

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

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index1
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def move_to_index2
    if @item.record.present?
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :situation_id, :delivery_charge_id, :area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
