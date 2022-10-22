class Public::ItemsController < ApplicationController
  before_action :current_customer, only: [:show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def cart_item_params
      params.require(:items).permit(:name, :image_id, :price)
  end

end