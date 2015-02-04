class Denominacion < ActiveRecord::Base
  self.table_name = "denominaciones"

  has_many :bodegas
end