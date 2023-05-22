class Admin::OrdersController < ApplicationController
  def new
    @order = Order.new
  end 
  def index
    @orders=Order.all
  end 
  def show
    @order=Order.find(params[:id])
  end 
  def confirmation
  end 
  def complete
  end 
  def create 
    @order = Order.new(order_params)
    @order.save
    redirect_to 
  end 
  
  private
  
  def order_params
    params.require(:order).premit(:customer_id, :postage, :method_of_payment, :payment, :address_name)
  end 
end
