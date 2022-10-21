class Public::OrdersController < ApplicationController
  def comfirm
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

end
