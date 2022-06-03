class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index1, except: [:create]
  before_action :move_to_index2, except: [:create]

  def index
    @record_home = RecordHome.new
  end

  def create
    @record_home = RecordHome.new(record_params)
    if @record_home.valid?
       pay_item
      @record_home.save
      redirect_to root_path
    else
      render :index
    end
  end

   def set_item
    @item = Item.find(params[:item_id])
   end

   def move_to_index1
    if @item.record.present?
      redirect_to root_path
    end
  end

  def move_to_index2
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  private
  def record_params
    params.require(:record_home).permit(:post_number, :area_id, :city, :house_number, :bilding_name, :phone_number, :user, :item, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: record_params[:token],  
      currency: 'jpy'  
    )
  end
end

