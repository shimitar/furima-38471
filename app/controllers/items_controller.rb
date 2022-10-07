class ItemsController < ApplicationController
  def index
    
  end

  def new
     @item = Item.new
  end

  def item_params
     params.require(:item).permit(:name, :price, :item_text, :category_id, :condition_id, :deliverycharge_id, :sender_id,  :numberday_id, :image).merge(user_id: current_user.id)
   end
end
