class CreateEnvejecimientos < ActiveRecord::Migration
  def change
    create_table :envejecimientos do |t|
      t.string :nombre
      t.timestamps
    end
  end
end
