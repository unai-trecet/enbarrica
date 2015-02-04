class RenameColumnDoToDenominacionBodegas < ActiveRecord::Migration
  change_table :bodegas do |t|
    t.rename :do_id, :denominacion_id
  end
end
