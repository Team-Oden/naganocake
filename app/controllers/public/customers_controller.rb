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
    redirect_to my_page_url
  end

  def withdraw
  end

end
