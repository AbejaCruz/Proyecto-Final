class Core::HomeController < ApplicationController
  include Users::SessionsHelper
  #Ignore the home page for autenticate_user method
  before_action :authenticate_user!, :except => [:index]

  #Check if the current user is signed, this method redirect to the autorizated path
  before_action :check_signed_in

  def index
  end

  def check_signed_in
    redirect_to resolve_redirection_url if signed_in?
  end
end
