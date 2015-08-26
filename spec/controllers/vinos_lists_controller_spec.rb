require 'rails_helper'

describe VinosListsController do 

  # describe 'GET new' do
  #   it 'sets @vinos_list as an instance of VinosList' do
  #     xhr :get, :new
  #     expect(assigns :vino_list)
  #   end
  # end

  describe 'POST create' do
    it 'creates a VinoLists' do
      lista = Fabricate :list
      vino = Fabricate :vino

      xhr :post, :create, vinos_list: { vino_id: vino.id, list_id: lista.id }

      expect(VinosList.count).to eq(1)
    end
  end  
end