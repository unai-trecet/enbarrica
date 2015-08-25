class CreateList < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :nombre
      t.references :user, index: true, foreign_key: true      
      t.timestamps      
    end
  end
end
