require "rails_helper"

describe SessionsController do 
  describe "GET new" do
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      let(:paquito) { Fabricate :user }

      before do
        post :create, email: paquito.email, password: paquito.password        
      end

      it "puts the signed in user in the session" do
        expect(session[:user_id]).to eq(paquito.id)
      end

      it "redirects to home page" do
        expect(response).to redirect_to root_path    
      end

      it "sets the notice" do
        expect(flash[:notice]).to be_present      
      end
    end

    context "with invalid credentials" do
      let(:paquito) { Fabricate :user }

      it "does not set the session with an incorrect email" do
        post :create, email: "correo_erroneo@mal.com", password: paquito.password
        expect(session[:user_id]).to be_nil
      end

      it "does not set the session with an incorrect password" do
        post :create, email: paquito.email, password: "passqordmal"
        expect(session[:user_id]).to be_nil
      end

      it "redirect to sign_in page" do
        post :create, email: paquito.email, password: "passqordmal"
        expect(response).to redirect_to sign_in_path
      end

      it "sets the error message" do
        post :create, email: paquito.email, password: "passqordmal"
        expect(flash[:error]).to be_present
      end
    end

    describe  "GET destroy" do
      
      it "redirect to root page" do
        get :destroy
        expect(response).to redirect_to root_path
      end

      it "sets session to nil" do
        paquito = Fabricate :user
        session[:user_id] = paquito.id

        get :destroy

        expect(session[:user_id]).to be_nil
      end


    end
  end
end