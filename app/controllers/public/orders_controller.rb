class Public::OrdersController < ApplicationController
  def comfirm
    @order = Order.new(order_params)
    # new画面から送られてきたデータを@orderに入れる
    if params[:order][:address_number] == "1"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:address_id])
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      else 
        render :new
      end
    
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
      else
        render :new
      end
      
    # else
      # redirect_to 遷移したいページ # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
    end
    
    # カートアイテムの情報をユーザーに確認してもらうために使用します
    @cart_items = current_customer.cart_items.all # カートアイテムの情報をユーザーに確認してもらうために使用します
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
  end

  def show
  end

  def create
  end


private
  
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :price, :payment_method)
  end
  
  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
end
