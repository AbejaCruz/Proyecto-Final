class Petition::InvoicesController < ApplicationController
  layout 'platform'
  def index
    @petition = Petition.find(params[:petition_id])
    @invoices = @petition.invoices
  end

end
