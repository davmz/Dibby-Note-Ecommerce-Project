class LessonsController < ApplicationController
  add_breadcrumb "Instrument Lessons", :lessons_path

  def index
    if params.key?(:lesson_filter)
      params[:lesson_filter].to_s == "New-Lesson" ? new_create_instrument : new_update_instrument
    else
      @instruments = Instrument.includes(:type)
                               .order("price ASC")
                               .page(params[:page])
                               .per(5)
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    add_breadcrumb "#{@lesson.instrument.name} Lesson", lesson_path(@lesson.id)
  end

  private

  def new_create_instrument
    @instruments = Instrument.where("created_at >= ?", Time.zone.now.beginning_of_day)
                             .order("price ASC")
                             .page(params[:page])
                             .per(5)
  end

  def new_update_instrument
    @instruments = Instrument.where("updated_at >= ?", Time.zone.now.beginning_of_day)
                             .order("price ASC")
                             .page(params[:page])
                             .per(5)
  end
end
