# Concern that manages concerns in the aplication￼
module Roles
  include ActiveSupport::Concern

  private

  def admin?
    current_user.has_role? :admin
  end

  def buyer?
    current_user.has_role? :buyer
  end

  def supplier?
    current_user.has_role? :supplier
  end  

  def recycler?
    current_user.has_role? :recycler
  end
end
