class InstrumentsController < ApplicationController
  def index
    if (params.has_key?(:instrument_filter))
      if (params[:instrument_filter].to_s == "New-Instrument")
        @instruments = Instrument.where("created_at >= ?", Time.zone.now.beginning_of_day)
                                .order("price ASC")
                                .page(params[:page])
                                .per(5)
      elsif
        @instruments = Instrument.where("updated_at >= ?", Time.zone.now.beginning_of_day)
                                .order("price ASC")
                                .page(params[:page])
                                .per(5)
      end
    else
      @instruments = Instrument.includes(:type)
                              .order("price ASC")
                              .page(params[:page])
                              .per(5)
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def search
    # if params.has_key?(:keywords)
    if !params[:keywords].nil? && !params[:type].nil?
      wildcard_search = "%#{params[:keywords]}%"
      type_id = "#{params[:type][:id]}"

      @instrument = Type.find(type_id)

      @instruments = Instrument.where("name LIKE ? AND type_id = ?", wildcard_search, type_id)
                              .order("price ASC")
                              .page(params[:page])
                              .per(6)
    else
      @instruments = Instrument.all
                              .order("price ASC")
                              .page(params[:page])
                              .per(6)
    end
    # wildcard_search = "%#{params[:keywords]}%"
    # type_id = "#{params[:type][:id]}"
    # @type = Type.find(type_id)

    # if params.has_key?(:keywords)
    #   @instruments = Instrument.all
    # end

    # if params.has_key?(:type)
    #   @instruments = Instrument.all
    #                           .order("price ASC")
    #                           .page(params[:page])
    #                           .per(5)
    # else
    #   @instruments = Instrument.all
    #                           .order("price ASC")
    #                           .page(params[:page])
    #                           .per(5)
    # end

    #   @instruments = Instrument.where("name LIKE ? AND type_id = ?", wildcard_search, type_id)
    #                           .order("price ASC")
    #                           .page(params[:page])
    #                           .per(5)
  end
end
