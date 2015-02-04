class BodegasController < ApplicationController
  def show
    @bodega = Bodega.find(params[:id])
  end
end