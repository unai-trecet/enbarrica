class Bodega < ActiveRecord::Base
  has_many :vinos
  belongs_to :denominacion
end