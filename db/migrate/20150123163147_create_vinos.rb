class CreateVinos < ActiveRecord::Migration
  def change
    create_table :vinos do |t|
      t.string :nombre
      t.integer :precio, :añada, :meses_envejecimiento
      t.integer :bodega_id, index: true
      t.integer :envejecimiento_id, index: true
      t.text :descripcion
      t.decimal :valoracion
      t.string :img_botella_small
      t.string :img_botella_big     
      t.timestamp      
    end
  end
end
