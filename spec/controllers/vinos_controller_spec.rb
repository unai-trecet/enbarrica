require "rails_helper"

describe VinosController do

  let(:rayo) { Fabricate :vino }

  describe "GET show" do

    it "renders show template" do
      get :show, id: rayo.id
      expect(response).to render_template :show
    end

    it "sets @vino" do
      get :show, id: rayo.id
      expect(assigns :vino).to eq(rayo)
    end

    it "sets comentarios with all the comentarios done about the vino"

    context "with authenticated user" do

      before { set_current_user }
      
      it "sets @comentario as Comentario instance" do
        get :show, id: rayo.id
        expect(assigns :comentario).to be_instance_of Comentario
      end

      it "sets @rating variable with the rating done by the user if it has allready been done"
      it "sets @rating variable with a new rating by the user if the vino has not been rated by the user."
      it "sets @lists variable with all the lists created by the user" do

      end
    end
  end
end