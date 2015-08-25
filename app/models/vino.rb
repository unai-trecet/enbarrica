class Vino < ActiveRecord::Base
  belongs_to :bodega
  belongs_to :denominacion
  belongs_to :envejecimiento

  has_many :uso_uvas_vinos
  has_many :tipo_uvas, through: :uso_uvas_vinos  

  has_many :comentarios, as: :comentable
  has_many :ratings

  has_many :vinos_lists
  has_many :lists, through:  :vinos_lists

  def average_rating
    ratings.size > 0 ? ratings.sum(:valoracion) / ratings.size : nil
  end
end