class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def edit
    @customer = current_customer
    if @customer == current_customer
      render "edit"
    else
      redirect_to public_customer_path(current_user)
    end
  end
  def update
    @customer = current_customer
    if @customer.update(customer_params)
    redirect_to customers_path
    else 
    render customers_information_edit_path
    end 
  end
  def show
    @customer = current_customer
  end
  def confirmation
    @customer= current_customer
  end
  def create
  end
  def withdrawal
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    # flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_namr_kana, :postal_code, :address, :telephone_number)
  end
end
