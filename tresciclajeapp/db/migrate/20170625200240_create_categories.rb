class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.integer :material_id
      t.string  :name
      t.decimal :base_price, { precision: 50, scale: 2 }
      t.decimal :iva, { precision: 2, scale: 2 }

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true
  end
end
