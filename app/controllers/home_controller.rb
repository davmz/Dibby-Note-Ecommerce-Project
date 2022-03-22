class HomeController < ApplicationController
  def index
    @instrumentypes = InstrumentType.all
  end
end
