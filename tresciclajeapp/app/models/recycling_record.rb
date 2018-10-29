class RecyclingRecord < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :source, required: true
  has_many :details
  
end
