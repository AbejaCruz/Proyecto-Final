class ContactsController < ApplicationController
  #Ignore the home page for autenticate_user method
  before_action :authenticate_user!, :except => [:new]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Gracias por contactarte con nosotros. Pronto estaremos revisando tu solicitud'
    else
      flash.now[:error] = 'No se pudo enviar el mensaje.'
      render :new
    end
  end
end
