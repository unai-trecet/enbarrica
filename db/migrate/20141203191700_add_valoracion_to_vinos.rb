class AddValoracionToVinos < ActiveRecord::Migration
  def change
    add_column :vinos, :valoracion, :decimal
  end
end
