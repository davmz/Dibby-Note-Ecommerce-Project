class InstrumentsController < ApplicationController
  add_breadcrumb "Instruments", :instruments_path
  before_action :fetch_search_instruments, only: [:search]

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to instruments_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to instruments_path
  end

  def index
    if params.key?(:instrument_filter)
      params[:instrument_filter].to_s == "New-Instrument" ? new_create_instrument : new_update_instrument
    else
      @instruments = Instrument.includes(:type)
                               .order("price ASC")
                               .page(params[:page])
                               .per(5)
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
    add_breadcrumb @instrument.name, instrument_path(@instrument.id)
  end

  def search
    ## Both Empty
    search_noparam_instrument if params[:keywords].blank? && params[:type][:id] !~ /^[+-]?\d+$/

    ## Only Instrument
    search_instrument_instrument if params[:keywords].present? && params[:type][:id] !~ /^[+-]?\d+$/
  end

  private

  def fetch_search_instruments
    ## Has Both
    search_bothparam_instrument if params[:keywords].present? && params[:type][:id] =~ /^[+-]?\d+$/

    ## Only Type
    search_type_instrument if params[:keywords].blank? && params[:type][:id] =~ /^[+-]?\d+$/
  end

  def new_create_instrument
    search_flash_msg
    @instruments = Instrument.where("created_at >= ?", Time.zone.now.beginning_of_day)
                             .order("price ASC")
                             .page(params[:page])
                             .per(5)
  end

  def new_update_instrument
    search_flash_msg
    @instruments = Instrument.where("updated_at >= ?", Time.zone.now.beginning_of_day)
                             .order("price ASC")
                             .page(params[:page])
                             .per(5)
  end

  def search_bothparam_instrument
    wildcard_search = "%#{params[:keywords]}%"
    search_flash_msg
    @instrument = Type.find(params[:type][:id])

    @instruments = Instrument.where("name LIKE ? AND type_id = ?", wildcard_search, params[:type][:id])
                             .order("price ASC")
                             .page(params[:page])
                             .per(4)
  end

  def search_type_instrument
    search_flash_msg
    @instrument = Type.find(params[:type][:id])

    @instruments = Instrument.where("type_id = #{params[:type][:id]}")
                             .order("price ASC")
                             .page(params[:page])
                             .per(4)
  end

  def search_instrument_instrument
    wildcard_search = "%#{params[:keywords]}%"
    search_flash_msg
    @instruments = Instrument.where("name LIKE ?", wildcard_search)
                             .order("price ASC")
                             .page(params[:page])
                             .per(4)
  end

  def search_noparam_instrument
    search_flash_msg
    @instruments = Instrument.all
                             .order("price ASC")
                             .page(params[:page])
                             .per(6)
  end

  def search_flash_msg
    flash[:search_msg] =
      "Search through our endless supply of high quality instruments.
      Search through all instrument or search through all. Enjoy shopping :)"
  end
end
