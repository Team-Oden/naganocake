class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers =Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
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