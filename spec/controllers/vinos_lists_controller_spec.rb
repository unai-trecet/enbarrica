require 'rails_helper'

describe VinosListsController do 

  describe 'POST create' do
    context 'the vino is not in the list' do
      it 'creates a VinoLists' do
        lista = Fabricate :list
        vino = Fabricate :vino

        xhr :post, :create, vino_id: vino.id, list_id: lista.id 

        expect(VinosList.count).to eq(1)
      end

      it 'renders vinos show page' do
        lista = Fabricate :list
        vino = Fabricate :vino

        xhr :post, :create, vino_id: vino.id, list_id: lista.id 

        expect(response).to redirect_to vino_path(vino)
      end 
    end

    context 'the vino is allready in the list' do
      it 'does not create a Vino List' do
        lista = Fabricate :list
        vino = Fabricate :vino        
        vino_list1 = Fabricate :vinos_list, vino_id: vino.id, list_id: lista.id

        xhr :post, :create, vino_id: vino.id, list_id: lista.id 

        expect(VinosList.count).to eq(1) 
      end

      it 'renders vino template' do 
        lista = Fabricate :list
        vino = Fabricate :vino        
        vino_list1 = Fabricate :vinos_list, vino_id: vino.id, list_id: lista.id

        xhr :post, :create, vino_id: vino.id, list_id: lista.id 

        expect(response).to render_template 'vinos/show'
      end
    end
  end  
end