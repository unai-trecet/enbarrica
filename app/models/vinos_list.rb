class VinosList < ActiveRecord::Base
  belongs_to :vino 
  belongs_to :list
end