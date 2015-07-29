class Bodega < ActiveRecord::Base
  has_many :vinos
  belongs_to :denominacion
  has_many :comentarios, as: :comentable
end