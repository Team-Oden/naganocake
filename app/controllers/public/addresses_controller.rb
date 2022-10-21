class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
    # @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path, notice: "登録が完了しました。"
    else
      @addresses = current_customer.addresses
      render 'index'
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: "変更が保存されました。"
    else
      render 'edit'
    end
  end

  def destroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
    redirect_to addresses_path
  end
  
  private

  def address_params
    params.require(:address).permit(:name,:address,:postal_code)
  end

end