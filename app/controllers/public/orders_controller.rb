class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end 
  def index
    @orders=Order.all
  end 
  def show
    @order=Order.find(params[:id])
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end 
  def confirmation
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.customer_id = current_customer.id
    
    if params[:order][:select_address] == "0"
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
    end
  end 
  def complete
  end 
  def create 
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
    current_customer.cart_items.each do |order_item|
    @order_item = OrderItem.new
    @order_item.order_id = @order.id
    @order_item.item_id = order_item.item_id
    @order_item.amount = order_item.amount
    @order_item.price = order_item.item.price
    @order_item.save
    end 
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
    end 
  end 
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :name, :address, :total_payment, :customer_id, :postage, :method_of_payment, :payment, :address_name)
  end 
end
