class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :petition_id
      t.boolean :disponible
      t.string :description
      t.decimal :actual_amount, { precision: 8, scale: 2 }
      t.decimal :initial_amount , { precision: 8, scale: 2 }
      t.date :registration_date
      t.integer :priority
      t.date :expiration_date
      t.decimal :price, { precision: 12, sacale: 2}

      t.timestamps null: false
    end
  end
end
