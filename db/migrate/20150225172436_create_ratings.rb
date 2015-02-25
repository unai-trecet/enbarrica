class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :comentario, index: true
      t.references :user, index: true
      t.float :valoracion
      t.timestamps
    end

    add_reference :comentarios, :rating, index: true
  end
end
