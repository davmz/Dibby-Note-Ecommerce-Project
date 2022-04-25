class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  before_action :load_cart

  protect_from_forgery
  helper_method :dibby_pages
  # helper_method :cart
  add_breadcrumb "Home", :root_path

  protected

  def dibby_pages
    Page.all
  end

  def load_cart
    @cart = Instrument.find(session[:cart])
  end

  def initialize_session
    session[:cart] ||= []
  end

  # def cart
  #   Instrument.find(session[:cart])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email password password_confirmation first_name
                                               last_name address province_id])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email password password_confirmation current_password
                                               first_name last_name address province_id])
  end
end
