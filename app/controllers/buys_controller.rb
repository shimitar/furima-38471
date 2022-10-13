class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @buy_place = BuyPlace.new
  end

  def create
    @buy_place = BuyPlace.new(buy_params)
    if @buy_place.valid?
      @buy_place.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_place).permit(:post_code, :sender_id, :street, :address, :building_name, :phone, :buy_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
