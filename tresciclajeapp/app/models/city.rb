class City < ActiveRecord::Base
  has_many :zones
  belongs_to :department
end
