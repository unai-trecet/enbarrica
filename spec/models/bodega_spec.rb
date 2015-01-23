require 'rails_helper'
require 'shoulda/matchers'

describe Bodega do
  it { should have_many(:vinos) }
end