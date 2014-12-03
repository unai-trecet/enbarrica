class AddImgBotellaToVinos < ActiveRecord::Migration
  def change
    add_column :vinos, :img_botella_small, :string
    add_column :vinos, :img_botella_big, :string
  end
end
