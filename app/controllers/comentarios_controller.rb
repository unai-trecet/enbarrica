class ComentariosController < ApplicationController
  before_filter :require_user, :get_commented_object
  before_action
  respond_to :html, :js

  def new
    @comentario = @comentable.comentarios.new
  end

  def create
    @comentario = @comentable.comentarios.new(comentario_params)
    @comentario.user = current_user
    if @comentario.save
      redirect_to @comentable
    else
      render "vinos/show"
    end    
  end

  private

  def comentario_params
    params.require(:comentario).permit(:comentario)
  end

  def get_commented_object
    # binding.pry
    if params[:vino_id]
      @comentable = Vino.find(params[:vino_id])
    end
  end
end