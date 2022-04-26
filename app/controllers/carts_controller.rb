class CartsController < ApplicationController
  helper_method :calculate_gst
  helper_method :calculate_hst
  helper_method :calculate_pst
  helper_method :calculate_totaltax
  helper_method :calculate_total

  def index
    add_breadcrumb "Cart", :instruments_path

    @cart = Instrument.find(session[:cart])
    @total_price = 0

    @cart.each do |total|
      @total_price += total.price
    end

    @province = Province.find(current_user.province_id)
  end

  def calculate_gst
    if @province.tax.gst.present?
      (@province.tax.gst * @total_price).round(2)
    else
      0
    end
  end

  def calculate_hst
    if @province.tax.hst.present?
      (@province.tax.hst * @total_price).round(2)
    else
      0
    end
  end

  def calculate_pst
    if @province.tax.pst.present?
      (@province.tax.pst * @total_price).round(2)
    else
      0
    end
  end

  def calculate_totaltax
    (calculate_gst + calculate_hst + calculate_pst).round(2)
  end

  def calculate_total
    (calculate_totaltax + @total_price).round(2)
  end
end
