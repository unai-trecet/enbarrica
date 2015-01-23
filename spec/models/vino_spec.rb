require 'rails_helper'
require 'shoulda/matchers'

describe Vino do
  it { should belong_to(:bodega) }
end