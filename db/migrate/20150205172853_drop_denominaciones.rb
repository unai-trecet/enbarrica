class DropDenominaciones < ActiveRecord::Migration
  def change
    drop_table :denominaciones
  end
end
