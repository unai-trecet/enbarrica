class ComentariosController < ApplicationController
  before_filter :require_user

  def new
    @comentario = Comentario.new
  end

  def create
    commented_object = find_commented_object 
    

    redirect_to commented_object
  end

  private

  def find_commented_object
    object = case params["comentable_type"]
             when "vino"
               Vino.find(params["comentable_id"])
             end
  end
end