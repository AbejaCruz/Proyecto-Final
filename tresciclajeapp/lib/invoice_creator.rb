class InvoiceCreator


  def self.create_invoice_for (petition, offer)

    if petition.actual_amount > offer.actual_amount
      consume_whole_offer(petition, offer)
    else
      consume_partial_offer(petition, offer)
    end

  end

  def self.consume_whole_offer (petition, offer)
    petition.invoices.create(offer: offer, actual_amount: offer.actual_amount)
    petition.update(actual_amount: petition.actual_amount - offer.actual_amount)
    #revisar este metodo porque no esta funcionando cuando se cumple que por ejemplo se consuma toda la oferta
    offer.update(actual_amount: 0.0, disponible: false)    
  end

  def self.consume_partial_offer(petition, offer)
    petition.invoices.create(offer: offer, actual_amount: petition.actual_amount)
    puts "Valores iniciales oferta= #{offer.actual_amount} peticion= #{petition.actual_amount}"
    offer.update(actual_amount: offer.actual_amount - petition.actual_amount)
    petition.update(actual_amount: 0.0, status: "CERRADA")
    if (offer.actual_amount == 0.0)
      offer.update(disponible: false)
    end
  end

end
