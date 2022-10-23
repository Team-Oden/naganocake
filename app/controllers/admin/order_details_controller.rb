class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:order_detail][:order_detail_id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "in_production"
        @order.update(status: :in_production)
      elsif @order.order_details.count == @order.order_details.where(making_status: "production_complete").count
        @order.update(status: :preparing_delivery)
      end
      redirect_to request.referer
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
