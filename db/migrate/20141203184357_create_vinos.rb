class CreateVinos < ActiveRecord::Migration
  def change
    create_table :vinos do |t|
      t.string :nombre
      t.integer :id_bodega, :precio, :añada, :id_envejecimiento, :meses_envejecimiento
      t.integer :id_tipo_uva1, :id_tipo_uva_2, :id_tipo_uva_3, :id_tipo_uva_4, :id_tipo_uva1_5
      t.text :descripcion
      t.timestamp
    end
  end
end
