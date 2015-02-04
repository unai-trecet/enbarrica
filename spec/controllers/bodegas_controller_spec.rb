require 'rails_helper'

describe BodegasController do
  describe "GET show" do
    it "renders show template" do
      bodega = Fabricate :bodega
      get :show, id: bodega.id

      expect(response).to render_template :show
    end

    it "sets @bodegas" do
      bodega = Fabricate :bodega
      get :show, id:bodega.id

      expect(assigns :bodega).to eq(bodega)
    end
  end
end