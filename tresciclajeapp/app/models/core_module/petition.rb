class Petition < ActiveRecord::Base
  has_one :category
  belongs_to :category
  has_many :invoices
  has_many :offers, through: :invoices
  belongs_to :created_by, foreign_key: 'user_id', class_name: 'User'
  validates :actual_amount, :presence => { message: "Ingrese la Cantidad Requerida" }
  validates :description, :presence => {message: "Ingrese una descripción de como necesita el material requerido"}
  validates :shipping_address, :presence => {message: "Ingrese una la Dirección de Envío"}
end
