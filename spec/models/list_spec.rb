require 'rails_helper'
require 'shoulda/matchers'

describe List do
  it { should belong_to(:user) }

  it { should have_many(:vinos) }
  it { should have_many(:vinos_lists) }  
end