class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
    add_index :materials, :name, unique: true
  end
end
