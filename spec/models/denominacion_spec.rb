require 'rails_helper'

describe Denominacion do 
  it { should have_many(:bodegas) }
end