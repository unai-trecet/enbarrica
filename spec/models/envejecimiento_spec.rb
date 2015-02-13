require 'rails_helper'
require 'shoulda/matchers'

describe Envejecimiento do 
  it { should have_many(:vinos) }
end