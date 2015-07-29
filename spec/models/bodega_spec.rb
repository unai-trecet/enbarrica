require 'rails_helper'
require 'shoulda/matchers'

describe Bodega do
  it { should have_many(:vinos) }
  it { should belong_to(:denominacion) }
  it { should have_many(:comentarios) }

  context "comentarios and rating" do
    let(:finca_estacada) { Fabricate :bodega }
    before do
      estacada_crianza = Fabricate :vino, bodega_id: finca_estacada.id
      estacada_reserva = Fabricate :vino, bodega_id: finca_estacada.id
      estacada_gran_reserva = Fabricate :vino, bodega_id: finca_estacada.id

      ana = Fabricate :user
      jose = Fabricate :user
      marta = Fabricate :user
      
      anas_rating_estacada_reserva = Fabricate :rating, user_id: ana.id, vino_id: estacada_reserva.id, valoracion: 7
      joses_rating_estacada_reserva = Fabricate :rating, user_id: jose.id, vino_id: estacada_reserva.id, valoracion: 10
      martas_rating_estacada_reserva = Fabricate :rating, user_id: marta.id, vino_id: estacada_reserva.id, valoracion: 4

      anas_rating_estacada_gran_reserva = Fabricate :rating, user_id: ana.id, vino_id: estacada_gran_reserva.id, valoracion: 9
      joses_rating_estacada_gran_reserva = Fabricate :rating, user_id: jose.id, vino_id: estacada_gran_reserva.id, valoracion: 9
      martas_rating_estacada_gran_reserva = Fabricate :rating, user_id: marta.id, vino_id: estacada_gran_reserva.id, valoracion: 3
    end    

    describe "number_of_rated_vinos" do
      it "returns the number of rated vinos belonged by the bodega" do
        expect(finca_estacada.number_of_rated_vinos).to eq(2)
      end
    end
    
    describe "average_rating" do
      it "returns the average rating of all the bodega's vinos" do        
        expect(finca_estacada.average_rating).to eq(7)
      end
    end
  end
end