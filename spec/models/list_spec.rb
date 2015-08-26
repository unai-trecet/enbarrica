require 'rails_helper'
require 'shoulda/matchers'

describe List do
  it { should belong_to(:user) }

  it { should have_many(:vinos) }
  it { should have_many(:vinos_lists) }  

  it { should validate_presence_of(:nombre) }
  it { should validate_presence_of(:user_id) }
end