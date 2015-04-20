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
       xhr :patch, :update, id: rating.id, vino_id: vino.id, user_id: user.id, valoracion: 3
      end

      # it "renders vino show page" do        
      #   expect(response).to redirect_to vino_path(vino.id)
      # end

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
    context "for authenticated users" do 

      let(:user) { Fabricate :user }
      let(:vino) { Fabricate :vino }

      before { session[:user_id] = user.id  } 

      context "with valid input" do
        
        before { xhr :post, :create, rating: { valoracion: 3, vino_id: vino.id, user_id: user.id } }

        it "redirects to vino page" do
          expect(response).to redirect_to vino_path vino.id
        end

        it "creates a rating" do
          expect(Rating.count).to eq(1)
        end

        it "creates a raing associated to the rated vino" do
          expect(Rating.last.vino).to eq(vino)
        end

        it "creates a raing associated to the user" do
          expect(Rating.last.user).to eq(user)
        end
      end

      context "current user has allready done one rating for this vino" do
        it "does not create a rating if the user has allready created one" do
          rating = Fabricate :rating, user_id: user.id, vino_id:vino.id
          xhr :post, :create, rating: { valoracion: 3, vino_id: vino.id, user_id: user.id }

          expect(Rating.last).to eq(rating)
          expect(Rating.count).to eq(1)
        end
      end

      context "with invalid input" do
        it "does not create a rating without valoracion" do
          xhr :post, :create, rating: { vino_id: vino.id, user_id: user.id } 
          expect(Rating.count).to eq(0)
        end

        it "does not create a rating without a vino" do
          xhr :post, :create, rating: { user_id: user.id, valoracion: 3 } 
          expect(Rating.count).to eq(0)
        end        

        it "does not create a rating without an user" do
          xhr :post, :create, rating: { vino_id: vino.id, valoracion: 3 } 
          expect(Rating.count).to eq(0)
        end            

        it "rednders vino template" do
          xhr :post, :create, rating: { vino_id: vino.id, valoracion: 3 } 
          expect(response).to render_template "vinos/show"
        end
      end
    end

    context "for unauthenticated users" do
      it "redirects to sign_in page" do
        xhr :post, :create
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end