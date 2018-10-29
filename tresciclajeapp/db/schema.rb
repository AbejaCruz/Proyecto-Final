# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180506163308) do

  create_table "association_records", force: :cascade do |t|
    t.integer  "user_id",                limit: 4
    t.string   "transaction_id",         limit: 255
    t.decimal  "carton_weight",                      precision: 8, scale: 2
    t.decimal  "archivo_weight",                     precision: 8, scale: 2
    t.decimal  "revista_weight",                     precision: 8, scale: 2
    t.decimal  "plegadiza_weight",                   precision: 8, scale: 2
    t.decimal  "periodico_weight",                   precision: 8, scale: 2
    t.decimal  "rev_con_cristal_weight",             precision: 8, scale: 2
    t.decimal  "rev_sin_cristal_weight",             precision: 8, scale: 2
    t.decimal  "vasi_sop_weight",                    precision: 8, scale: 2
    t.decimal  "pvc_weight",                         precision: 8, scale: 2
    t.decimal  "plastico_weight",                    precision: 8, scale: 2
    t.decimal  "va_weight",                          precision: 8, scale: 2
    t.decimal  "chatarra_weight",                    precision: 8, scale: 2
    t.decimal  "patio_weight",                       precision: 8, scale: 2
    t.decimal  "aluminio_weight",                    precision: 8, scale: 2
    t.decimal  "perfil_weight",                      precision: 8, scale: 2
    t.decimal  "amarillo_weight",                    precision: 8, scale: 2
    t.decimal  "rojo_weight",                        precision: 8, scale: 2
    t.decimal  "bronce_weight",                      precision: 8, scale: 2
    t.decimal  "pet_ben_weight",                     precision: 8, scale: 2
    t.decimal  "vidrio_weight",                      precision: 8, scale: 2
    t.decimal  "envase_weight",                      precision: 8, scale: 2
    t.decimal  "vino_weight",                        precision: 8, scale: 2
    t.decimal  "espuma_weight",                      precision: 8, scale: 2
    t.decimal  "canastas_weight",                    precision: 8, scale: 2
    t.decimal  "canecas_weight",                     precision: 8, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "material_id", limit: 4
    t.string   "name",        limit: 255
    t.decimal  "base_price",              precision: 50, scale: 2
    t.decimal  "iva",                     precision: 2,  scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "cities", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.integer "department_id", limit: 4
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "petition_id",    limit: 4
    t.integer  "offer_id",       limit: 4
    t.decimal  "actual_amount",            precision: 8, scale: 2
    t.decimal  "initial_amount",           precision: 8, scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "materials", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "materials", ["name"], name: "index_materials_on_name", unique: true, using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "category_id",       limit: 4
    t.integer  "petition_id",       limit: 4
    t.boolean  "disponible"
    t.string   "description",       limit: 255
    t.decimal  "actual_amount",                 precision: 8,  scale: 2
    t.decimal  "initial_amount",                precision: 8,  scale: 2
    t.date     "registration_date"
    t.integer  "priority",          limit: 4
    t.date     "expiration_date"
    t.decimal  "price",                         precision: 12
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "petitions", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "category_id",      limit: 4
    t.decimal  "actual_amount",                precision: 8, scale: 2
    t.decimal  "initial_amount",               precision: 8, scale: 2
    t.string   "shipping_address", limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "status",           limit: 255
    t.string   "description",      limit: 255
  end

  create_table "recycling_records", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "source_id",      limit: 4
    t.integer  "modified_by_id", limit: 4
    t.decimal  "weight",                   precision: 8, scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sources", force: :cascade do |t|
    t.integer  "zone_id",          limit: 4
    t.string   "name",             limit: 255
    t.string   "address",          limit: 255
    t.string   "kind",             limit: 255
    t.string   "admin_name",       limit: 255
    t.integer  "amount_of_people", limit: 4
    t.integer  "number_of_floors", limit: 4
    t.integer  "apt_per_floor",    limit: 4
    t.integer  "blocks",           limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "phone",                  limit: 255
    t.string   "address",                limit: 255
    t.integer  "created_by",             limit: 4
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "nit",                    limit: 255
    t.integer  "city_id",                limit: 4
    t.string   "description",            limit: 255
    t.string   "photo_file_name",        limit: 255
    t.string   "photo_content_type",     limit: 255
    t.integer  "photo_file_size",        limit: 4
    t.datetime "photo_updated_at"
    t.string   "prefix",                 limit: 255
    t.integer  "zone_id",                limit: 4
  end

  add_index "users", ["created_by"], name: "index_users_on_created_by", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree
  add_index "users", ["zone_id"], name: "index_users_on_zone_id", using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "zones", force: :cascade do |t|
    t.string  "name",    limit: 50
    t.integer "city_id", limit: 4
  end

end
