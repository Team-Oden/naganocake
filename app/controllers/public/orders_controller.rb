class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def comfirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
        @order.postal_code = Address.find(params[:order][:registered]).postal_code
      else
        render :new
      end

    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
    end
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    @request_amount = @total + 800
    # 合計金額を出す処理です sum_price はモデルで定義したメソッドです
  end

  def complete
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def index
    @order = current_customer.orders
  end

  def show
    @orders = current_customer.orders
    @order = current_customer.orders.find(params[:id])
  end

  def create
    @cart_items = current_customer.cart_items.all
    total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    @request_amount = total + 800
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.price
        order_detail.save
        # pp order_detail
        # order_detail.errors.full_messages.each do |msg|
          # pp msg
        # end
      end
      @cart_items.destroy_all
      redirect_to complete_path


    else
      @order = Order.new(order_params)
      render :new
    end
  end


private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :price, :payment_method,:total_payment)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
end
