require 'rails_helper'

describe Denominacion do 
  it { should have_many(:bodegas) }
  it { should have_many(:vinos) }
  # it { should have_many(:tipo_uvas) }
end