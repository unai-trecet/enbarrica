require 'rails_helper'

describe BodegasController do
  describe "GET show" do
    let(:bodega) { Fabricate :bodega }
    before { get :show, id: bodega.id }

    it "renders show template" do
      expect(response).to render_template :show
    end

    it "sets @bodegas" do      
      expect(assigns :bodega).to eq(bodega)
    end

    it "sets @comentario as an instance of Comentario" do
      expect(assigns :comentario).to be_instance_of Comentario
    end
  end
end