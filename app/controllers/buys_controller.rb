class BuysController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!

  def index
    @buy_place = BuyPlace.new
  end

  def create
    @buy_place = BuyPlace.new(buy_params)
    if @buy_place.valid?
      pay_item
      @buy_place.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_place).permit(:post_code, :sender_id, :street, :address, :building_name, :phone).merge( item_id: params[:item_id], user_id: current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
