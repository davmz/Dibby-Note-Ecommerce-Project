class CartController < ApplicationController
  # POST / cart
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include? (id)
      session[:shopping_cart] << id
      instrument = Instrument.find(id)
      flash[:notice] = "#{instrument.name} added to your cart."
      redirect_to root_path
    end
  end

  # DELETE /cart/:id
  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    instrument = Instrument.find(id)
    flash[:notice] = "#{instrument.name} removed from cart."
    redirect_to root_path
  end
end
