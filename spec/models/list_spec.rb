require 'rails_helper'
require 'shoulda/matchers'

describe List do
  it { should belong_to(:user) }
end