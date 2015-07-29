class BodegasController < ApplicationController
  def show
    @bodega = Bodega.find(params[:id])
    @comentario = Comentario.new
  end
end