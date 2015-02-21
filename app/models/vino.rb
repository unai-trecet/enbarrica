class Vino < ActiveRecord::Base
  belongs_to :bodega
  belongs_to :denominacion
  belongs_to :envejecimiento

  has_many :uso_uvas_vinos
  has_many :tipo_uvas, through: :uso_uvas_vinos  

  has_many :comentarios, as: :comentable
end