require "rails_helper"

describe ComentariosController do 
  
  describe "GET new" do
    context "for authenticated users" do     
      let(:user) { Fabricate :user }

      before { session[:user_id] = user.id }

      it "sets @comentario variable" do
        get :new
        expect(assigns :comentario).to be_a Comentario
      end

      context "vino as commented object" do
        it "sets commented_object variable" do
          estacada = Fabricate :vino

          get :new, vino_id: estacada.id
          expect(assigns :commented_object).to eq(estacada)
        end
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
        context "commenting vino" do

          let(:estacada) { Fabricate :vino }
          before { post :create, comentario: { comentable_id: estacada.id, comentable_type: "Vino", comentario: "Paquito es muy brasas.", user_id: user.id } }      
          
          it "redirects to vino show page" do
            expect(response).to redirect_to estacada     
          end

          it "creates a comentario" do
            expect(Comentario.count).to eq(1)
          end

          it "creates a comentario assciated with the current user" do
            expect(Comentario.last.user).to eq(user)
          end

          it "creates a comentario associated with a vino object specified by the id" do 
            expect(Comentario.last).to eq(estacada.comentarios.last)
          end
        end
      end

      context "with invalid input" do

        let(:estacada) { Fabricate :vino }
        before { post :create, comentario: { comentable_id: estacada.id, comentable_type: "Vino", user_id: user.id } }

        it "does not create a comentario" do
          expect(Comentario.count).to eq(0)
        end

        it "renders create template" do
          expect(response).to render_template :create
        end
        
        it "sets error message"

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