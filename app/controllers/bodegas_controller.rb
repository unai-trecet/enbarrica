class BodegasController < ApplicationController
  def show
    @bodega = Bodega.find(params[:id])
    @comentarios = @bodega.comentarios
    @comentario = Comentario.new
  end
end