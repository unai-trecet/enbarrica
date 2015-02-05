require 'rails_helper'
require 'shoulda/matchers'

describe TipoUva do 
  # it { should have_many(:denominaciones) }
  it { should have_many(:vinos) }
end