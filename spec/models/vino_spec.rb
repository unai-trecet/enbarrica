require 'rails_helper'
require 'shoulda/matchers'

describe Vino do
  it { should belong_to(:bodega) }
  it { should belong_to(:denominacion) }
  it { should belong_to(:envejecimiento) }
  
  it { should have_many(:tipo_uvas) }
  it { should have_many(:ratings) }
  it { should have_many(:comentarios) }
  it { should have_many(:lists) }
  it { should have_many(:vinos_lists) }

  describe "average_rating" do
    let(:estacada) { Fabricate :vino }
    it "returns the average valoracion of every rating done for this vino" do

      ana = Fabricate :user
      jose = Fabricate :user
      marta = Fabricate :user
      
      anas_rating = Fabricate :rating, user_id: ana.id, vino_id: estacada.id, valoracion: 7
      joses_rating = Fabricate :rating, user_id: jose.id, vino_id: estacada.id, valoracion: 10
      martas_rating = Fabricate :rating, user_id: marta.id, vino_id: estacada.id, valoracion: 4

      expect(estacada.average_rating).to eq(7)
    end

    it "returns nil if the number of ratings is 0" do
      expect(estacada.average_rating).to be_nil
    end
  end
end