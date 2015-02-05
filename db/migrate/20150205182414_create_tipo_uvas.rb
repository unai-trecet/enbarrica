class CreateTipoUvas < ActiveRecord::Migration
  def change
    create_table :tipo_uvas do |t|
      t.string :nombre, :img1
      t.text :descrpcion, :historia, :caracteristicas
      t.timestamp
    end
  end
end
