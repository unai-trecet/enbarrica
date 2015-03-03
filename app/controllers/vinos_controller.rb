class VinosController < ApplicationController
  def show
    @vino = Vino.find(params[:id])
    @comentario = Comentario.new
  end
end