class AssociationRecord < ActiveRecord::Base
  before_create :set_uuid

  def set_uuid
    self.transaction_id = SecureRandom.uuid
  end
end
  