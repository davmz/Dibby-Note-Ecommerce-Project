class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session

  helper_method :dibby_pages
  helper_method :cart

  add_breadcrumb "Home", :root_path

  include ApplicationHelper

  protected

  def dibby_pages
    Page.all
  end

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    Instrument.find(session[:shopping_cart])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email password password_confirmation first_name
                                               last_name address province_id])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email password password_confirmation current_password
                                               first_name last_name address province_id])
  end
end
