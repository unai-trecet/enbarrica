class VinosListsController < ApplicationController

  respond_to :js, :html

  def create
    @vinos_list = VinosList.new(vino_id: params[:vino_id], list_id: params[:list_id])
    @vinos_list.save
    vino = Vino.find(params[:vino_id])
    redirect_to vino_path vino 
  end

  private 

  def vinos_list_params
    params.require(:vinos_list).permit(:vino_id, :list_id)
  end

end