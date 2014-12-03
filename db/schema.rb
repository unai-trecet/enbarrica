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

ActiveRecord::Schema.define(version: 20141203193059) do

  create_table "vinos", force: true do |t|
    t.string  "nombre"
    t.integer "id_bodega"
    t.integer "precio"
    t.integer "envejecimiento"
    t.integer "añada"
    t.integer "id_envejecimiento"
    t.integer "meses_envejecimiento"
    t.integer "id_tipo_uva1"
    t.integer "id_tipo_uva_2"
    t.integer "id_tipo_uva_3"
    t.integer "id_tipo_uva_4"
    t.integer "id_tipo_uva1_5"
    t.text    "descripcion"
    t.decimal "valoracion"
    t.string  "img_botella_small"
    t.string  "img_botella_big"
  end

end
