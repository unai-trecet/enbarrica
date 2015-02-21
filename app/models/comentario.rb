class Comentario < ActiveRecord::Base
  belongs_to :comentable_id, polymorphic: true
end