class ItemsController < ApplicationController
  def index
    
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
  
  def item_params
     params.require(:item).permit(:name, :price, :item_text, :category_id, :condition_id, :delivery_charge_id, :sender_id,  :number_day_id, :image).merge(user_id: current_user.id)
   end
end
