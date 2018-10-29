class InvoicesController < ApplicationController
  layout 'platform'

  def create
    petition = Petition.find(params[:petition_id])
    offer = Offer.find(params[:offer_id])
    InvoiceCreator.create_invoice_for(petition, offer)
    puts petition_invoices_path(petition)
    redirect_to petition_invoices_path(petition)
  end



end
