class AddDenominacionIdToVinos < ActiveRecord::Migration
  def change
    add_column :vinos, :denominacion_id, :integer
  end
end
