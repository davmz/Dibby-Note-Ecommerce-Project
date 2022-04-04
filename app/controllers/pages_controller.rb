class PagesController < ApplicationController
  before_action :set_page, only: %i[ show edit update destroy ]
  http_basic_authenticate_with name: "admin", password: "password"

  # GET /pages or /pages.json
  def index
    @pages = Page.all
  end

  def about
    @page = Page.find_by(permalink: "about")
  end

  def contact
    @page = Page.find_by(permalink: "contact")
  end

  def faq
    @page = Page.find_by(permalink: "faq")
  end

  # GET /pages/1 or /pages/1.json
  # def show
  # end
  # we replace show with permalink because we wanted to leverage permaliknks opposed to individual ids
  def permalink
    @page = Page.find_by(permalink: params[:permalink])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title, :content, :permalink)
    end
end