require "rails_helper"

describe ComentariosController do 
  
  describe "GET new" do
    context "for authenticated users" do     
      let(:user) { Fabricate :user }

      before do
        session[:user_id] = user.id 
        get :new
      end

      it "renders new template" do         
        expect(response).to render_template :new
      end

      it "sets @comentario variable" do
        expect(assigns :comentario).to be_a Comentario
      end
    end  

    context "for unauthenticated users" do
      it "redirects to sign_in page" do
        get :new 
        expect(response).to redirect_to sign_in_path
      end
    end
  end  
  
  describe "POST create" do
    context "for authenticated users" do 
      let(:user) { Fabricate :user }

      before { session[:user_id] = user.id }       
      
      context "with valid input" do
        context "commenting a vino" do
          it "redirects to vino show page" do
            estacada = Fabricate :vino
            opinion = Fabricate :comentario

            post :create, comentable_id: estacada.id, comentable_type: "vino", comentario: opinion.comentario
            expect(response).to redirect_to estacada     
          end

          # it "creates a comentario" do
          #   estacada = Fabricate :vino
          #   opinion = Fabricate :comentario

          #   post :create, id: estacada.id, type
          #   expect(Comentario.last.comentario).to eq(opinion.comentario)
          # end

          it "creates a comentario assciated with the current user"
          it "creates a comentario associated with an object of the specified type"
          it "creates a comentario associated with the object specified by the id passed"
        end


      end

      context "with invalid input" do

      end
    end

    context "for unauthenticated users" do

    end
  end

  describe "POST update" do

  end

  describe "DELETE destroy" do

  end
end