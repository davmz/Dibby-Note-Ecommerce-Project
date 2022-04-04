class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.includes(:type).all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end
end
