require 'rails_helper'

describe EnvejecimientosController do 
  describe "GET show" do
    it "renders show template" do
      crianza = Fabricate :envejecimiento
      get :show, id: crianza.id

      expect(response).to render_template :show
    end

    it "sets @envejecimietno variable" do
      crianza = Fabricate :envejecimiento
      get :show, id:crianza.id

      expect(assigns :envejecimiento).to eq(crianza)
    end
  end
end