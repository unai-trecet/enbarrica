class ListsController < ApplicationController
  respond_to :html, :js

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        flash[:notice] = "Lista creada con éxito"
        format.js { render inline: "location.reload()" }
        format.html { redirect_to user_path(current_user) }
      else
        flash[:error] = "Tiene que darle un nombre a la lista"
        format.js { render inline: "location.reload()" }
        format.html { render current_user }
      end
    end  
  end

  private

  def list_params
    params.require(:list).permit(:nombre, :user_id)
  end
end