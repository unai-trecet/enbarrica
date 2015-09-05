require 'rails_helper'
require 'shoulda/matchers'

describe VinosList do
  it { should belong_to(:vino) }
  it { should belong_to(:list) }

  it { should validate_presence_of(:vino_id) }
  it { should validate_presence_of(:list_id) }  

  # it { should validate_uniqueness_of(:vino_id) }
end