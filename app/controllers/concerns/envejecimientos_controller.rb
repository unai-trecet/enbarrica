class EnvejecimientosController < ApplicationController
  def show
    @envejecimiento = Envejecimiento.find(params[:id])
  end    
end