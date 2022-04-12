class InstrumentsController < ApplicationController
  add_breadcrumb "Instruments", :instruments_path

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
    add_breadcrumb @instrument.name, instrument_path(@instrument.id)
  end

  def search
    flash[:search_msg] = "Search through our endless supply of high quality instruments. Search through all instrument or search through all. Enjoy shopping :)"

    wildcard_search = "%#{params[:keywords]}%"
    type_id = "#{params[:type][:id]}"

    ## HAS BOTH
    if (!params[:keywords].blank? && params[:keywords].present?) && type_id =~ /^[+-]?\d+$/
      @instrument = Type.find(type_id)

      @instruments = Instrument.where("name LIKE ? AND type_id = ?", wildcard_search, type_id)
                                .order("price ASC")
                                .page(params[:page])
                                .per(4)

    ## BOTH EMPTY
    elsif (params[:keywords].blank? && !params[:keywords].present?) && type_id !~ /^[+-]?\d+$/
      @instruments = Instrument.all
                        .order("price ASC")
                        .page(params[:page])
                        .per(6)


    ## KEYWORD EMPTY
    elsif (params[:keywords].blank? && !params[:keywords].present?) && type_id =~ /^[+-]?\d+$/
      @instrument = Type.find(type_id)

      @instruments = Instrument.where("type_id = ?", type_id)
                                .order("price ASC")
                                .page(params[:page])
                                .per(4)

    ## TYPE EMPTY
    elsif (!params[:keywords].blank? && params[:keywords].present?) && type_id !~ /^[+-]?\d+$/
      @instruments = Instrument.where("name LIKE ?", wildcard_search)
                                .order("price ASC")
                                .page(params[:page])
                                .per(4)
    end
  end
end
