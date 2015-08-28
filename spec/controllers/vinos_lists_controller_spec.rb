require 'rails_helper'

describe VinosListsController do 

  describe 'POST create' do
    it 'creates a VinoLists' do
      lista = Fabricate :list
      vino = Fabricate :vino

      xhr :post, :create, vinos_list: { vino_id: vino.id, list_id: lista.id }

      expect(VinosList.count).to eq(1)
    end

    it 'renders vinos show page' do
      lista = Fabricate :list
      vino = Fabricate :vino

      xhr :post, :create, vinos_list: { vino_id: vino.id, list_id: lista.id }

      expect(response).to render_template 'vinos/show'
    end 
  end  
end