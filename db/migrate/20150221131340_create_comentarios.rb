class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text :comentario
      t.integer :comentable_id, index: true
      t.string :comentable_type
      t.timestamps
    end
  end
end
