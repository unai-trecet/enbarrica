class Comentario < ActiveRecord::Base
  belongs_to :vino
  belongs_to :user
  has_one :rating
end