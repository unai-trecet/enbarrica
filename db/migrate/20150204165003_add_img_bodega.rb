class AddImgBodega < ActiveRecord::Migration
  def change
    add_column :bodegas, :img1, :string
  end
end
