class InstrumentsController < ApplicationController
  def index
    if (params.has_key?(:instrument_filter))
      if (params[:instrument_filter].to_s == "New-Instrument")
        @instruments = Instrument.where("created_at >= ?", Time.zone.now.beginning_of_day)
      elsif
        @instruments = Instrument.where("updated_at >= ?", Time.zone.now.beginning_of_day)
      end
    else
      @instruments = Instrument.includes(:type).all.order("created_at desc")
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
  end
end
