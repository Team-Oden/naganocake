class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_kana, :first_kana, :postal_code, :telephone_number, :address, :email, :is_active)
  end

end
