class Public::AddressesController < ApplicationController
  def index
    @address = current_customer
    @new_address = Address.new
  end

  def edit
    @address = current_customer
  end

  def create
  end

  def update
  end

  def destroy
  end

end