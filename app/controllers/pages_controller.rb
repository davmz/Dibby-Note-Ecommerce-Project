class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]
  add_breadcrumb "Pages", :pages_path

  # http_basic_authenticate_with name: "admin", password: "password"

  # GET /pages or /pages.json
  def index
    @pages = Page.all
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  # GET /pages/1 or /pages/1.json
  def permalink
    @page = Page.find_by(permalink: params[:permalink])

    add_breadcrumb @page.title, permalink: params[:permalink]
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
