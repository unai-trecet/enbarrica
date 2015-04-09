require "rails_helper"

describe Rating do 
  it { should belong_to(:user) }
  it { should belong_to(:vino) }
  it { should validate_presence_of(:vino_id) }
  it { should validate_presence_of(:user_id) }  
  it { should validate_presence_of(:valoracion) }  
end