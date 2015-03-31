require 'rails_helper'
require 'shoulda/matchers'

describe Vino do
  it { should belong_to(:bodega) }
  it { should belong_to(:denominacion) }
  it { should belong_to(:envejecimiento) }
  
  it { should have_many(:tipo_uvas) }
  it { should have_many(:ratings) }
  it { should have_many(:comentarios) }
end