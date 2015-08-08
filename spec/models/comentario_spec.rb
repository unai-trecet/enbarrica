require 'rails_helper'
require 'shoulda/matchers'

describe Comentario do 
  it { should belong_to(:user) }

  it { should validate_presence_of(:comentario) }
  it { should validate_presence_of(:comentable_id) }
  it { should validate_presence_of(:comentable_type) }
  it { should validate_presence_of(:user_id) }
  
end