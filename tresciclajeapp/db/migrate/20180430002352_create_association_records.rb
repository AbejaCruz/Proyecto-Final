class CreateAssociationRecords < ActiveRecord::Migration
  def change
    create_table :association_records do |t|
      t.belongs_to :user
      t.integer :user_id
      t.string  :transaction_id
      t.decimal :carton_weight, { precision: 8, scale: 2 }
      t.decimal :archivo_weight, { precision: 8, scale: 2 }
      t.decimal :revista_weight, { precision: 8, scale: 2 }
      t.decimal :plegadiza_weight, { precision: 8, scale: 2 }
      t.decimal :periodico_weight, { precision: 8, scale: 2 }
      t.decimal :rev_con_cristal_weight, { precision: 8, scale: 2 }
      t.decimal :rev_sin_cristal_weight, { precision: 8, scale: 2 }
      t.decimal :vasi_sop_weight, { precision: 8, scale: 2 }
      t.decimal :pvc_weight, { precision: 8, scale: 2 }
      t.decimal :plastico_weight, { precision: 8, scale: 2 }
      t.decimal :va_weight, { precision: 8, scale: 2 }
      t.decimal :chatarra_weight, { precision: 8, scale: 2 }
      t.decimal :patio_weight, { precision: 8, scale: 2 }
      t.decimal :aluminio_weight, { precision: 8, scale: 2 }
      t.decimal :perfil_weight, { precision: 8, scale: 2 }
      t.decimal :amarillo_weight, { precision: 8, scale: 2 }
      t.decimal :rojo_weight, { precision: 8, scale: 2 }
      t.decimal :bronce_weight, { precision: 8, scale: 2 }
      t.decimal :pet_ben_weight, { precision: 8, scale: 2 }
      t.decimal :vidrio_weight, { precision: 8, scale: 2 }
      t.decimal :envase_weight, { precision: 8, scale: 2 }
      t.decimal :vino_weight, { precision: 8, scale: 2 }
      t.decimal :espuma_weight, { precision: 8, scale: 2 }
      t.decimal :canastas_weight, { precision: 8, scale: 2 }
      t.decimal :canecas_weight, { precision: 8, scale: 2 }
      t.timestamps null: false
    end
  end
end
