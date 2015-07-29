class Bodega < ActiveRecord::Base
  has_many :vinos
  belongs_to :denominacion
  has_many :comentarios, as: :comentable

  def number_of_rated_vinos
    contador = 0

    vinos.each do |vino|
      if vino.average_rating 
        contador += 1
      end
    end

    contador
  end

  def average_rating
    suma_rating = 0

    vinos.each do |vino|
      if vino.average_rating.present? 
        suma_rating += vino.average_rating
      end
    end

    suma_rating / number_of_rated_vinos
  end
end