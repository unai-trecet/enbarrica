class TipoUva < ActiveRecord::Base
  has_many :uso_uvas_vinos
  has_many :vinos, through: :uso_uvas_vinos

  has_many :uso_uvas_denominacions
  has_many :denominaciones, through: :uso_uvas_denominaciones 
end