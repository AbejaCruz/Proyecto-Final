class CreateRecyclingRecords < ActiveRecord::Migration
  def change
    create_table :recycling_records do |t|
      t.belongs_to :user
      t.integer :user_id      
      t.integer :source_id
      t.integer :modified_by_id
      t.decimal :weight, { precision: 8, scale: 2 }
      t.timestamps null: false
    end
  end
end
