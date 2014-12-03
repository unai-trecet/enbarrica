require 'rails_helper'

describe VinosController do
  describe 'GET show' do
    it "renders show template" do
      rayo = Fabricate :vino
      get :show, id: rayo.id

      expect(response).to render_template :show
    end

    it 'sets @vino' do
      rayo = Fabricate :vino
      get :show, id: rayo.id

      expect(assigns :vino).to eq(rayo)
    end
  end
end