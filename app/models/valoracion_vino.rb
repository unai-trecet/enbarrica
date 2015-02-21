class ValoracionVino < ActiveRecord::Base
  belongs_to :vino
  belongs_to :user
end