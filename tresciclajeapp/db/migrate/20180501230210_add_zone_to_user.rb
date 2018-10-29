class AddZoneToUser < ActiveRecord::Migration
  def change    
    add_reference :users, :zone, index: true
  end
end
