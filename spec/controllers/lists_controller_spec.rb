require 'rails_helper'

describe ListsController do 
  
  describe 'GET show' do

  end

  describe 'GET new' do
    
    it 'sets @list variable' do
      xhr :get, :new
      expect(assigns :list).to be_instance_of List
    end
  end

  describe 'POST create' do
    context 'with valid input' do
      
      before do
        ana = Fabricate :user
        xhr :post, :create, list: { user_id: ana.id, nombre: "Lista test" }
      end

      it 'creates a list' do
        expect(List.count).to eq(1)
      end

      it 'set notice message' do
        expect(flash[:notice]).to be_present        
      end
    end

    context 'with invalid input'
      
      before do
        ana = Fabricate :user
        xhr :post, :create, list: { user_id: ana.id }
      end

      it 'does not create a list' do
        expect(List.count).to eq(0)
      end

      it 'sets the error' do
        expect(flash[:error]).to be_present
      end   
  end 
end