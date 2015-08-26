class List < ActiveRecord::Base
  belongs_to :user

  has_many :vinos_lists
  has_many :vinos, through: :vinos_lists 

  validates_presence_of :nombre, :user_id
end