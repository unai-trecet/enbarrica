require 'rails_helper'

describe RatingsController do 
  
  describe "update" do
    context "for authenticated users" do 
      let(:user) { Fabricate :user }
      let(:rating) { Fabricate :rating }
      let(:vino) { Fabricate :vino }

      before do
       session[:user_id] = user.id 
       rating.user = user
       rating.vino = vino
       patch :update, id: rating.id, vino_id: vino.id, user_id: user.id, valoracion: 3
      end

      it "renders vino show page" do        
        expect(response).to redirect_to vino_path(vino.id)
      end

      it "sets the @rating varible with the id passed by" do
        expect(assigns :rating).to eq(rating)
      end

      it "updates rating's valoracion" do
        expect(Rating.last.valoracion).to eq(3)
      end
    end

    context "for unauthenticated users" do
      it "redirects to sign_in page" do
        patch :update, id: 1
        expect(response).to redirect_to sign_in_path
      end
    end
  end  

  describe "create" do

  end
end