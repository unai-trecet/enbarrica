class VinosListsController < ApplicationController

  respond_to :js, :html

  def create
    @vinos_list = VinosList.new(vino_id: params[:vino_id], list_id: params[:list_id])
    @vino = Vino.find(params[:vino_id])
    if @vinos_list.save
      redirect_to vino_path @vino
    else
      render action: "vinos/"
    end 
  end

  private 

  def vinos_list_params
    params.require(:vinos_list).permit(:vino_id, :list_id)
  end

end