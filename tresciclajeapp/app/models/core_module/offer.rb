class Offer < ActiveRecord::Base
  belongs_to :category
  has_many :petitions, through: :invoices
  belongs_to :created_by, foreign_key: 'user_id', class_name: 'User'
  validates :category_id, :presence => { message: "Debe Escoger una Categoria" }
  validates :description, :presence => { message: "Debe Ingresar una descripcion para la Oferta" }
  validates :actual_amount, :presence => { message: "Debe Ingresar una cantidad de la oferta" }
  validates :registration_date, :presence => { message: "Debe Ingresar una Fecha de Registro para la Oferta" }
  validates_numericality_of :actual_amount, :greater_than => 200.0, :message => "La Cantidad de la Oferta debe ser mayor a 200 kg", on: :create

  def total_price (amount, base_price, iva)
    if amount.nil?
    else
      price = ((base_price * iva) + base_price) * amount
    end
  end

  def expiration_offer (registration_date)
    expiration_date = (registration_date + 30).to_s
  end
end
