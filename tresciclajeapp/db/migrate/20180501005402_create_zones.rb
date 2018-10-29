class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string "name",    limit: 50
      t.integer "city_id"
    end
  end
end
