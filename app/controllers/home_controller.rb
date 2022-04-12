class HomeController < ApplicationController
  def index
    @instruments = Instrument.all

    @types = Type.all

    @lessons = Lesson.all

    @provinces = Province.all

    @taxes = Tax.all

    @pages = Page.all

    @users = User.all

    session[:user_name] = current_user.first_name if user_signed_in?
  end
end
