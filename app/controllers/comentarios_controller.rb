class ComentariosController < ApplicationController
  before_filter :require_user
  respond_to :html, :js

  def new
    @commented_object = find_commented_object
    @comentario = Comentario.new
  end

  def create
    commented_object = find_commented_object
    commented_object.comentarios.create(comentario_params)
    redirect_to commented_object
  end

  private

  def comentario_params
    params.require(:comentario).permit(:comentario, :user_id)
  end

  def find_commented_object
    if params[:vino_id]
      Vino.find(params[:vino_id])
    end
  end
end