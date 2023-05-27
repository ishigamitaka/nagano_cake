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
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @orders = Order.all
    binding.pry
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    params[:order][:select_address]
  end 
  def complete
  end 
  def create 
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_comfirmation_path
  end 
  
  private
  
  def order_params
    params.require(:order).premit(:customer_id, :postage, :method_of_payment, :payment, :address_name)
  end 
end
