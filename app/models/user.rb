class User < ActiveRecord::Base
  has_secure_password 

  validates_presence_of :email, :full_name, :password, :password_confirmation
  validates_uniqueness_of :email

  has_many :comentarios, as: :comentable
  has_many :ratings
  has_many :lists  

  def has_rated_vino? vino
    ratings.map(&:vino).include? vino
  end
end