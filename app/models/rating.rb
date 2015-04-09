class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :vino

  validates_presence_of :user_id, :vino_id, :valoracion
end