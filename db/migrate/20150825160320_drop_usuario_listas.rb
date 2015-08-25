class DropUsuarioListas < ActiveRecord::Migration
  def change
    drop_table :usuario_listas
  end
end
