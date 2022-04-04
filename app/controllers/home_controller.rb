class HomeController < ApplicationController
  def index
    @instruments = Instrument.all

    @types = Type.all

    @lessons = Lesson.all

    @provinces = Province.all

    @taxes = Tax.all

    @pages = Page.all
  end
end
