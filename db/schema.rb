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

ActiveRecord::Schema.define(version: 20150825155320) do

  create_table "bodegas", force: true do |t|
    t.string   "nombre"
    t.string   "web"
    t.string   "email"
    t.string   "direccion"
    t.string   "cp"
    t.string   "tlf1"
    t.string   "tlf2"
    t.integer  "denominacion_id"
    t.integer  "provincia_id"
    t.text     "descripcion"
    t.string   "img1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brasas", force: true do |t|
    t.string "brasas"
  end

  create_table "comentarios", force: true do |t|
    t.text     "comentario"
    t.integer  "comentable_id"
    t.string   "comentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating_id"
    t.integer  "user_id"
  end

  add_index "comentarios", ["rating_id"], name: "index_comentarios_on_rating_id"
  add_index "comentarios", ["user_id"], name: "index_comentarios_on_user_id"

  create_table "denominaciones", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.text     "historia"
    t.text     "descripcion_tipos_uva"
    t.string   "img1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "envejecimientos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", force: true do |t|
    t.string   "nombre"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.float    "valoracion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vino_id"
  end

  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"
  add_index "ratings", ["vino_id"], name: "index_ratings_on_vino_id"

  create_table "tipo_uvas", force: true do |t|
    t.string   "nombre"
    t.string   "img1"
    t.text     "descrpcion"
    t.text     "historia"
    t.text     "caracteristicas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uso_uvas_vinos", force: true do |t|
    t.integer  "vino_id"
    t.integer  "tipo_uva_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uso_uvas_vinos", ["tipo_uva_id"], name: "index_uso_uvas_vinos_on_tipo_uva_id"
  add_index "uso_uvas_vinos", ["vino_id"], name: "index_uso_uvas_vinos_on_vino_id"

  create_table "usuario_listas", force: true do |t|
    t.integer  "user_id"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuario_listas", ["user_id"], name: "index_usuario_listas_on_user_id"

  create_table "vinos", force: true do |t|
    t.string   "nombre"
    t.integer  "precio"
    t.integer  "añada"
    t.integer  "meses_envejecimiento"
    t.integer  "bodega_id"
    t.integer  "envejecimiento_id"
    t.text     "descripcion"
    t.decimal  "valoracion"
    t.string   "img_botella_small"
    t.string   "img_botella_big"
    t.integer  "denominacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
