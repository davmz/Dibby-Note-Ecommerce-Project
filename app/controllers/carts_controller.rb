class CartsController < ApplicationController
  def index
    add_breadcrumb "Cart", :instruments_path

    @cart = Instrument.find(session[:cart])
  end
end
