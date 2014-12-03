class VinosController < ApplicationController
  def show
    @vino = Vino.find(params[:id])
  end

end