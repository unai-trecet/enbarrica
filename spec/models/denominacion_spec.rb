require 'rails_helper'

describe Denominacion do 
  it { should have_many(:bodegas) }
  it { should have_many(:vinos) }
end