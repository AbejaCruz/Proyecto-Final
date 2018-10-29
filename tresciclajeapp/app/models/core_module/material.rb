class Material < ActiveRecord::Base
  has_many :categories
  belongs_to :created_by, foreign_key: 'user_id', class_name: 'User'
  validates :name, :presence => { message: "Debe ingresar un nombre para el Material" }
end
