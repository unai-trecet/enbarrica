class DenominacionesController < ApplicationController
  def show
    @denominacion = Denominacion.find(params[:id])
  end
end