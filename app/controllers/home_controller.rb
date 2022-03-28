class HomeController < ApplicationController
  def index
    @instruments = Instrument.all

    @types = Type.all

    @lessons = Lesson.all

    @provinces = Province.all

    @taxes = Tax.all
  end
end
