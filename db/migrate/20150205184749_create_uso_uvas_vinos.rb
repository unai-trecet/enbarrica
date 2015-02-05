class CreateUsoUvasVinos < ActiveRecord::Migration
  def change
    create_table :uso_uvas_vinos do |t|
      t.belongs_to :vino, index: true
      t.belongs_to :tipo_uva, index: true
      t.timestamps
    end
  end
end
