class RecreateDenominaciones < ActiveRecord::Migration
  def change
    create_table :denominaciones do |t|
      t.string :nombre
      t.text :descripcion, :historia, :descripcion_tipos_uva
      t.timestamp
    end
  end
end
