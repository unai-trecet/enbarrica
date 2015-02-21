class CreateValoracionVinos < ActiveRecord::Migration
  def change
    create_table :valoracion_vinos do |t|
      t.integer :user_id, :vino_id, index: true
      t.float :valoracion
      t.text :comentario
      t.timestamps
    end
  end
end
