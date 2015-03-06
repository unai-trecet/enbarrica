class Comentario < ActiveRecord::Base
  belongs_to :comentable, polymorphic: true

  belongs_to :vino
  belongs_to :user
  has_one :rating

  validates_presence_of :comentario, :comentable_id, :comentable_type, :user_id
end