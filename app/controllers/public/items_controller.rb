class Public::ItemsController < ApplicationController
  def index
  end 
  def show
  end 
  private
  def item_params
    params.require(:list).permit(:name, :intrduction, :price, :image)
  end
end
