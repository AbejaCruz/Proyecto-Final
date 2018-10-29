class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.belongs_to :zone
      t.string :name
      t.string :address
      t.string :kind
      t.string :admin_name
      t.integer :amount_of_people
      t.integer :number_of_floors
      t.integer :apt_per_floor
      t.integer :blocks
      t.integer :zone_id
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
