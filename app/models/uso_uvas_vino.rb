class UsoUvasVino < ActiveRecord::Base
  belongs_to :vino 
  belongs_to :tipo_uva
end