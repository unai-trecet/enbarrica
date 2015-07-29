require 'rails_helper'
require 'shoulda/matchers'

describe Bodega do
  it { should have_many(:vinos) }
  it { should belong_to(:denominacion) }
  it { should have_many(:comentarios) }
end