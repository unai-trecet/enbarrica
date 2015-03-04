class AddUserRefferenceToComentarios < ActiveRecord::Migration
  def change
    add_reference :comentarios, :user, index: true
  end
end
