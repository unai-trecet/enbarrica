class CreateVinosLists < ActiveRecord::Migration
  def change
    create_table :vinos_lists do |t|
      t.references :vino, index: true, foreign_key: true 
      t.references :list, index: true, foreign_key: true 
      t.timestamps
    end
  end
end
