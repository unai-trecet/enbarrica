class VinosList < ActiveRecord::Base
  belongs_to :vino 
  belongs_to :list

  validates_presence_of :vino_id, :list_id
  validates :vino_id, uniqueness: { scope: :list_id, message: "Este vino ya está incluido en la lista." }
end