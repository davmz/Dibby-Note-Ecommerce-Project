class InstrumentItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.instrument_items.new(instrument_item_params)
    @order.save
    session[:order_id] = @order_id
  end

  private

  def order_item_params
    params.require(:instrument_item).permit(:insturment_id, :quantity)
  end
end
