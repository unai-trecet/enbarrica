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

    it "sets @comentario as Comentario instance" do
      get :show, id: rayo.id
      expect(assigns :comentario).to be_instance_of Comentario
    end

    it "sets @rating variable"

  end
end