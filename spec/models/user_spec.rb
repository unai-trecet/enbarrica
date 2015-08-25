require "rails_helper"
require 'shoulda/matchers'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }

  it { should validate_uniqueness_of(:email) }

  it { should have_many(:comentarios) } 
  it { should have_many(:ratings) }
  it { should have_many(:lists) }
end