class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all
  end

  def show
    # @customer = Customer.find(params[:id])
    @customer = current_customer
  end

  def edit
    # @customer = Customer.find(params[:id])
    @customer = current_customer
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員情報を編集しました。"
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_kana, :first_kana, :postal_code, :telephone_number, :address, :email, :is_active)
  end

end