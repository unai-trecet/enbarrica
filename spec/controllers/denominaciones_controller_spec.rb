require 'rails_helper'

describe DenominacionesController do 
  describe "GET show" do
    it "renders show template" do
      estacada = Fabricate :denominacion
      get :show, id: estacada.id

      expect(response).to render_template(:show)
    end

    it "sets @denominacion variable" do
      estacada = Fabricate :denominacion
      get :show, id: estacada.id

      expect(assigns :denominacion).to eq(estacada)
    end    
  end
end