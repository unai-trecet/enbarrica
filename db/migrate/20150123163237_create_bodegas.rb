class CreateBodegas < ActiveRecord::Migration
  def change
    create_table :bodegas do |t|
      t.string :nombre, :web, :email, :direccion, :cp, :tlf1, :tlf2
      t.integer :do_id, index: true
      t.integer :provincia_id, index: true
      t.text :descripcion
      t.timestamp
    end
  end
end
