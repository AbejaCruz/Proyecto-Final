class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.integer :user_id
      t.integer :category_id
      t.decimal :actual_amount, { precision: 8, scale: 2 }
      t.decimal :initial_amount , { precision: 8, scale: 2 }
      t.string :shipping_address

      t.timestamps null: false

    end
  end
end
