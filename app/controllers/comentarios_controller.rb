class ComentariosController < ApplicationController
  before_filter :require_user, :get_commented_object
  before_action :all_comentarios
  respond_to :html, :js

  def new
    @comentario = @comentable.comentarios.new
  end

  def create
    @comentario = @comentable.comentarios.new(comentario_params)
    @comentario.user = current_user

    if @comentario.save 
      flash[:notice] = "El comentario ha sido creado con éxito."
    else
      flash[:error] = "El comentario no ha podido ser creado debido a: #{ @comentario.errors.full_messages }"
    end
  end

  private

  def comentario_params
    params.require(:comentario).permit(:comentario)
  end

  def get_commented_object
    if params[:vino_id]
      @comentable = Vino.find(params[:vino_id])
    elsif params[:bodega_id]
      @comentable = Bodega.find(params[:bodega_id])
    end
  end

  def all_comentarios
    @comentarios = @comentable.comentarios.order(created_at: :desc)
  end
end