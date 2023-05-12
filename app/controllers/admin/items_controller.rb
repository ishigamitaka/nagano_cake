class Admin::ItemsController < ApplicationController
  def new
  end 
  def index
  end
  def show
  end 
  def edit
  end
  def item_params
    params.require(:list).permit(:name, :intrduction, :price, :image)
  end
end
