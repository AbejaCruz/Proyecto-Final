class ApplicationController < ActionController::Base
  include Roles

  before_action :authenticate_user!
  before_action :set_location
  protect_from_forgery with: :exception

  helper_method :admin?
  helper_method :buyer?
  helper_method :supplier?
  helper_method :association?
  helper_method :recycler?

  protected

  def set_location
    @location = { menu: 'not_defined', sub_menu: 'not_defined' }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, roles: []) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :photo) }
  end

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
