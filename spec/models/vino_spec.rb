require 'rails_helper'
require 'shoulda/matchers'

describe Vino do
  it { should belong_to(:bodega) }
  it { should belong_to(:denominacion) }
end