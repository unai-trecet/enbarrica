require 'rails_helper'
require 'shoulda/matchers'

describe VinosList do
  it { should belong_to(:vino) }
  it { should belong_to(:list) }
end