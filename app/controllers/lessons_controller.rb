class LessonsController < ApplicationController
  def index
    if (params.has_key?(:lesson_filter))
      if (params[:lesson_filter].to_s == "New-Lesson")
        @lessons = Instrument.where("created_at >= ?", Time.zone.now.beginning_of_day)
                            .order("price ASC")
                            .page(params[:page])
                            .per(5)
      elsif
        @lessons = Instrument.where("updated_at >= ?", Time.zone.now.beginning_of_day)
                            .order("price ASC")
                            .page(params[:page])
                            .per(5)
      end
    else
      @lessons = Lesson.includes(:instrument)
                        .order("price ASC")
                        .page(params[:page])
                        .per(5)
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
