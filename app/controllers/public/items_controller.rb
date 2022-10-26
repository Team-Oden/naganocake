class Public::ItemsController < ApplicationController
  before_action :current_customer, only: [:show]

  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
    @total_items = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
  
  def genre_items
    @genres = Genre.all
    @genre = Genre.find(params[:item_id])
    @genre_items = @genre.items.page(params[:page]).per(8)
  end


  private

  def cart_item_params
      params.require(:items).permit(:name, :image_id, :price, :genre_id,)
  end

end