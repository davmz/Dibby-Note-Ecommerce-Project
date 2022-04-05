class LessonsController < ApplicationController
  def index
    if (params.has_key?(:lesson_filter))
      if (params[:lesson_filter].to_s == "New-Lesson")
        @lessons = Instrument.where("created_at >= ?", Time.zone.now.beginning_of_day)
      elsif
        @lessons = Instrument.where("updated_at >= ?", Time.zone.now.beginning_of_day)
      end
    else
      @lessons = Lesson.includes(:instrument).all.order("price asc")
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
