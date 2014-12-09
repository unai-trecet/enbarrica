class DeleteColumnVinos < ActiveRecord::Migration
  def change
    remove_column :vinos, :envejecimiento
  end
end