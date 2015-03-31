class DeleteComentarioIdAddVinoId < ActiveRecord::Migration
  def change
    remove_column :ratings, :comentario_id
    add_reference :ratings, :vino, index: true
  end
end
