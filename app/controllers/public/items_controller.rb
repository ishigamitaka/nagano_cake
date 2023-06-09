class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end 
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @numbers = 0
    
  end 
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end
