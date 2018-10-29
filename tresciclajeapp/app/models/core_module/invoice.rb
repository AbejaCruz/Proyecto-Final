class Invoice < ActiveRecord::Base
  belongs_to :offer
  belongs_to :petition

end
