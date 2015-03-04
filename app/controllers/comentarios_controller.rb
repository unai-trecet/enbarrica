class ComentariosController < ApplicationController
  before_filter :require_user

  def new
    @comentario = Comentario.new
  end

  def create
    commented_object = find_commented_object 
    comentario = Comentario.create(comentario_params)    
    comentario.update_attribute(:comentable, commented_object)
    redirect_to commented_object
  end

  private

  def comentario_params
    params.require(:comentario).permit(:comentario, :user_id)
  end

  def find_commented_object
    commented_object = case params["comentario"]["comentable_type"]
             when "vino"
               Vino.find(params["comentario"]["comentable_id"])
             end
  end
end