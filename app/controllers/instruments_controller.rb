class InstrumentsController < ApplicationController
  add_breadcrumb "Instruments", :instruments_path

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
    if params[:keywords].present? || params[:type][:id] =~ /^[+-]?\d+$/
      search_param_instrument
    elsif params[:keywords].blank? && params[:type][:id] !~ /^[+-]?\d+$/
      search_noparam_instrument
    end
  end

  private

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

  def search_param_instrument
    search_flash_msg
    @instrument = Type.find(params[:type][:id])

    @instruments = Instrument.where("name LIKE %#{params[:keywords]}%
                                    AND type_id = #{params[:type][:id]}")
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
