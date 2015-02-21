require 'rails_helper'
require 'shoulda/matchers'

describe Comentario do 
  it { should belong_to(:vino) }
  it { should belong_to(:user) }
end