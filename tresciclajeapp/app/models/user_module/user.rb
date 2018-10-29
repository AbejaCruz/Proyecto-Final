class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  rolify
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  belongs_to :city
  belongs_to :zone

  attr_accessor :login
  validates :username, presence: { message: 'Debe Ingresar el Nombre del Usuario' }
  validates :phone, presence: { message: 'Debe Ingresar un Numero de Contacto' }
  validates :address, presence: { message: 'Debe Ingresar una Dirección' }

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


  def add_prefix (id, role)    
    if role == "supplier"
      prefix = "ASO-" + id.to_s
    elsif role == "buyer"
      prefix = "TRF-" + id.to_s
    elsif role == "admin"
      prefix = "ADM-" + id.to_s    
    elsif role == "recycler"
      prefix = "REC-" + id.to_s
    end

  end
end
