require 'rails_helper'

describe VinosController do
  describe 'GET show' do
    it 'sets @vino' do
      # rayo = Fabricate :vino
      rayo = new Vino
      get :show, id: rayo.id

      expect(assigns :vino).to eq(rayo)
    end
  end
end