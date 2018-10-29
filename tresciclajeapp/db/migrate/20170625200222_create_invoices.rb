class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :petition_id
      t.integer :offer_id

      t.decimal :actual_amount, { precision: 8, scale: 2 }
      t.decimal :initial_amount , { precision: 8, scale: 2 }

      t.timestamps null: false

    end
  end
end
