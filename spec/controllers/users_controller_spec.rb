require 'rails_helper'

describe UsersController do 
  describe "GET new" do
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end

    it "sets @user variable as an user instance" do
      get :new
      expect(assigns :user).to be_instance_of User
    end
  end

  describe "POST create" do
    context "with valid input" do
      before { post :create, user: { email: "paquito@paq.com", full_name: "paquito", password: "password", password_confirmation: "password" } } 

      it "redirect to root page" do
        expect(response).to redirect_to root_path
      end

      it "creates an user" do
        expect(User.count).to eq(1)
        expect(User.last.email).to eq("paquito@paq.com")
      end

      it "sets the notice message" do
        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid input" do
      it "does not create an user when password and password confirmation do not match" do
        post :create, user: { email: "paquito@paq.com", full_name: "paquito", password: "password", password_confirmation: "passwordbrasas" } 
        expect(User.count).to eq(0)
      end

      it "does not create without password and password confirmation" do
        post :create, user: { email: "paquito@paq.com", full_name: "" } 
        expect(User.count).to eq(0)
      end

      it "does not create an user whithout full name" do
        post :create, user: { email: "paquito@paq.com", full_name: "", password: "password", password_confirmation: "password" } 
        expect(User.count).to eq(0)
      end

      it "does not create an user whithout email" do
        post :create, user: { full_name: "paquito", password: "password", password_confirmation: "password" } 
        expect(User.count).to eq(0)
      end

      it "renders new page" do
        post :create, user: { full_name: "paquito", password: "password", password_confirmation: "password" } 
        expect(response).to render_template 'new'
      end   

      it "sets the error message" do
        post :create, user: { full_name: "paquito", password: "password", password_confirmation: "password" }
        expect(flash[:error]).to be_present
      end
    end
  end
end