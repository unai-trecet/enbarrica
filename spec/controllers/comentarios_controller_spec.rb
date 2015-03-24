require "rails_helper"

describe ComentariosController do 
  
  describe "GET new" do
    context "for authenticated users" do     
      let(:user) { Fabricate :user }

      before { session[:user_id] = user.id }

      context "vino as commented object" do

        let(:estacada) { estacada = Fabricate :vino }

        before { get :new, vino_id: estacada.id }

        it "sets @comentable variable equal to the vino passed by" do          
          expect(assigns :comentable).to eq(estacada)
        end

        it "sets @comentario variable" do
          expect(assigns :comentario).to be_a Comentario
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

          before { post :create, comentario: { comentario: "Paquito es muy brasas." }, vino_id: estacada.id }

          it "redirects to vino show page" do
            expect(response).to redirect_to estacada     
          end

          it "creates a comentario" do
            expect(Comentario.count).to eq(1)
          end
          
          it "creates a comentario associated with a vino object specified by the id" do 
            expect(Comentario.last.comentable).to eq(estacada)
          end

          it "creates a comentario associated with the current user" do
            expect(estacada.comentarios.last.user).to eq(user)
          end

          it "sets the notice" do
            expect(flash[:notice]).to eq("El comentario ha sido creado con éxito.")
          end
        end
      end

      context "with invalid input" do
        context "commenting vino" do

          let(:estacada) { Fabricate :vino }
          before { post :create, comentario: { comentario: "" }, vino_id: estacada.id }

          it "does not create a comentario" do
            expect(Comentario.count).to eq(0)
          end

          it "renders commented vino's show template" do
            expect(response).to render_template :new
          end
          
          it "sets error message"
        end

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