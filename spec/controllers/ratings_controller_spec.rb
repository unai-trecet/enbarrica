require 'rails_helper'

describe RatingsController do 
  describe "PATCH update" do
    context "for authenticated users" do 
      let(:user) { Fabricate :user }
      let(:rating) { Fabricate :rating }
      let(:vino) { Fabricate :vino }

      before { session[:user_id] = user.id }

      it "sets the @rating varible with the id passed by" do
        rating.
        
        patch :update, vino_id: vino.id, user_id: user.id

        expect
      end

      it "updates rating's valoracion" do

      end
    end

    context "for unauthenticated users" do
      it "redirects to sign_in page"
      it "sets error message"
    end
  end  
end