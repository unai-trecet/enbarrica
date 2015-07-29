class Bodega < ActiveRecord::Base
  has_many :vinos
  belongs_to :denominacion
  has_many :comentarios, as: :comentable

  def average_rating
    suma_rating = 0
    contador = 0

    vinos.each do |vino|
      if vino.average_rating.present? 
        suma_rating += vino.average_rating
        contador += 1
      end
    end

    suma_rating / contador
  end
end