class Denominacion < ActiveRecord::Base
  self.table_name = "denominaciones"

  has_many :bodegas
  has_many :vinos
end