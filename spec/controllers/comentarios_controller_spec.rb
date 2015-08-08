require "rails_helper"

describe ComentariosController do 
  
  describe "GET new" do
    context "for authenticated users" do     
      let(:user) { Fabricate :user }

      before { session[:user_id] = user.id }

      context "vino as commented object" do

        let(:estacada) { estacada = Fabricate :vino }

        before { xhr :get, :new, vino_id: estacada.id, :format => 'js' }

        it "sets @comentable variable equal to the vino passed by" do          
          expect(assigns :comentable).to eq(estacada)
        end

        it "sets @comentario variable" do
          expect(assigns :comentario).to be_a Comentario
        end     
      end 

      context "bodega as commented object" do

        let(:finca_estacada) { Fabricate :bodega }

        before { xhr :get, :new, bodega_id: finca_estacada.id, :format => 'js' }

        it "sets @comentable variable equal to the bodega passed by" do          
          expect(assigns :comentable).to eq(finca_estacada)
        end

        it "sets @comentario variable" do
          expect(assigns :comentario).to be_a Comentario
        end        
      end
    end  

    context "for unauthenticated users" do
      it "redirects to sign_in page" do
        xhr :get, :new
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

          before { xhr :post, :create, comentario: { comentario: "Paquito es muy brasas." }, vino_id: estacada.id, :format => 'js' }

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

        context "commenting bodega" do

          let(:finca_estacada) { Fabricate :bodega }

          before { xhr :post, :create, comentario: { comentario: "Paquito es muy brasas." }, bodega_id: finca_estacada.id, :format => 'js' }

          it "creates a comentario" do
            expect(Comentario.count).to eq(1)
          end
          
          it "creates a comentario associated with a vino object specified by the id" do 
            expect(Comentario.last.comentable).to eq(finca_estacada)
          end

          it "creates a comentario associated with the current user" do
            expect(finca_estacada.comentarios.last.user).to eq(user)
          end

          it "sets the notice" do
            expect(flash[:notice]).to eq("El comentario ha sido creado con éxito.")
          end
        end        
      end

      context "with invalid input" do
        context "commenting vino" do

          let(:estacada) { Fabricate :vino }
          before { xhr :post, :create, comentario: { comentario: "" }, vino_id: estacada.id, :format => 'js' }

          it "does not create a comentario" do
            expect(Comentario.count).to eq(0)
          end

          it "sets error message" do
            expect(flash[:error]).to be_present
          end
        end

        context "commenting bodega" do

          let(:finca_estacada) { Fabricate :bodega }
          before { xhr :post, :create, comentario: { comentario: "" }, bodega_id: finca_estacada.id, :format => 'js' }

          it "does not create a comentario" do
            expect(Comentario.count).to eq(0)
          end

          it "sets error message" do
            expect(flash[:error]).to be_present
          end
        end
      end
    end

    context "for unauthenticated users" do

    end
  end
end