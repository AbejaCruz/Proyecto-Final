class Category < ActiveRecord::Base
  belongs_to :material

  belongs_to :created_by, foreign_key: 'user_id', class_name: 'User'
  validates :name, presence: { message: 'Debe Ingresar el nombre de la Categoria' }
  validates :base_price, presence: { message: 'Debe Ingresar un precio Base' }
  validates :iva, presence: { message: 'Debe Ingresar el valor del Iva' }
  validates :material_id, presence: { message: 'Debe Seleccionar un Material' }
  validates_numericality_of :base_price, :grater_than => 0, :message => "el valor debe ser mayor a 0"
  validates_numericality_of :iva, :grater_than => 0, :message => "El valor debe ser mayor o igual a 0 en casos que no tenga iva"
end
