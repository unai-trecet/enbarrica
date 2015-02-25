class DropValoracionVinos < ActiveRecord::Migration
  def change
    drop_table :valoracion_vinos
  end
end
