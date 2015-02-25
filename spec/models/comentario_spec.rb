require 'rails_helper'
require 'shoulda/matchers'

describe Comentario do 
  it { should have_one(:rating) }
end