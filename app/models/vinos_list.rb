class VinosList < ActiveRecord::Base
  belongs_to :vino 
  belongs_to :list

  validates_presence_of :vino_id, :list_id
end