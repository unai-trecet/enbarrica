require 'rails_helper'
require 'shoulda/matchers'

describe Comentario do 
  it { should have_one(:rating) }
  it { should belong_to(:user) }
end