class Source < ActiveRecord::Base
  belongs_to :zone, required: true
  has_many :recycling_records  
end
