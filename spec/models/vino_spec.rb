require 'rails_helper'
require 'shoulda/matchers'

describe Vino do
  it { should belong_to(:bodega) }
  it { should belong_to(:denominacion) }
  it { should belong_to(:envejecimiento) }
  
  it { should have_many(:tipo_uvas) }
  it { should have_many(:ratings) }
  it { should have_many(:comentarios) }

  describe "average_rating" do
    it "returns the average valoracion of every rating done for this vino" do
      estacada = Fabricate :vino
      ana = Fabricate :user
      jose = Fabricate :user
      marta = Fabricate :user
      
      anas_rating = Fabricate :rating, user_id: ana.id, vino_id: estacada.id, valoracion: 7
      joses_rating = Fabricate :rating, user_id: jose.id, vino_id: estacada.id, valoracion: 10
      martas_rating = Fabricate :rating, user_id: marta.id, vino_id: estacada.id, valoracion: 4

      expect(estacada.average_rating).to eq(7)
    end
  end
end