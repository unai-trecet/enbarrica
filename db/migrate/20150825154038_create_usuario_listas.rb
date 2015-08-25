class CreateUsuarioListas < ActiveRecord::Migration
  def change
    create_table :usuario_listas do |t|
      t.references :user, index: true, foreign_key: true
      t.string :nombre
      t.timestamps
    end
  end
end
