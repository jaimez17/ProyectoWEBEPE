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

ActiveRecord::Schema.define(version: 20150219044333) do

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "empresa_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "empleado_id"
  end

  add_index "areas", ["empresa_id"], name: "index_areas_on_empresa_id"

  create_table "categoria", force: :cascade do |t|
    t.string   "name"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categoria", ["area_id"], name: "index_categoria_on_area_id"

  create_table "categorias", force: :cascade do |t|
    t.string   "name"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "estado"
  end

  add_index "categorias", ["area_id"], name: "index_categorias_on_area_id"

  create_table "comentarios", force: :cascade do |t|
    t.string   "comentario"
    t.integer  "ticket_id"
    t.integer  "empleado_id"
    t.integer  "usuario_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comentarios", ["empleado_id"], name: "index_comentarios_on_empleado_id"
  add_index "comentarios", ["ticket_id"], name: "index_comentarios_on_ticket_id"
  add_index "comentarios", ["usuario_id"], name: "index_comentarios_on_usuario_id"

  create_table "empleados", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "username"
    t.integer  "empresa_id"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.integer  "role_id"
  end

  add_index "empleados", ["area_id"], name: "index_empleados_on_area_id"
  add_index "empleados", ["empresa_id"], name: "index_empleados_on_empresa_id"

  create_table "empresas", force: :cascade do |t|
    t.string   "name"
    t.string   "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "knows", force: :cascade do |t|
    t.string   "name"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategoria", force: :cascade do |t|
    t.string   "name"
    t.integer  "categoria_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "subcategoria", ["categoria_id"], name: "index_subcategoria_on_categoria_id"

  create_table "subcategorias", force: :cascade do |t|
    t.string   "name"
    t.integer  "categoria_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "estado"
  end

  add_index "subcategorias", ["categoria_id"], name: "index_subcategorias_on_categoria_id"

  create_table "tickets", force: :cascade do |t|
    t.string   "asunto"
    t.integer  "prioridad"
    t.integer  "empresa_id"
    t.integer  "usuario_id"
    t.integer  "empleado_id"
    t.integer  "categoria_id"
    t.integer  "subcategoria_id"
    t.integer  "area_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "tipo"
    t.string   "codigo"
    t.integer  "estado"
  end

  add_index "tickets", ["area_id"], name: "index_tickets_on_area_id"
  add_index "tickets", ["categoria_id"], name: "index_tickets_on_categoria_id"
  add_index "tickets", ["empleado_id"], name: "index_tickets_on_empleado_id"
  add_index "tickets", ["empresa_id"], name: "index_tickets_on_empresa_id"
  add_index "tickets", ["subcategoria_id"], name: "index_tickets_on_subcategoria_id"
  add_index "tickets", ["usuario_id"], name: "index_tickets_on_usuario_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "codigo"
    t.integer  "empresa_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "primer_nombre"
    t.string   "segundo_nombre"
    t.string   "role_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "usuarios", ["empresa_id"], name: "index_usuarios_on_empresa_id"

end
