class AddImgToDenominacion < ActiveRecord::Migration
  def change
    add_column :denominaciones, :img1, :string
  end
end
