class Vino < ActiveRecord::Base
  belongs_to :bodega
  belongs_to :denominacion
end