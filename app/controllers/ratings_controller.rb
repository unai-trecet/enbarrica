class RatingsController < ApplicationController
  before_filter :require_user
  
  def update
    @rating = Rating.find(params[:id])
    @vino = @rating.vino
    @rating.update_attribute(:valoracion, params[:valoracion])
  end

  def create
    @rating = Rating.new(rating_params)
    @vino = Vino.find(params[:rating][:vino_id])
    
    unless current_user.has_rated_vino? @rating.vino
      respond_to do |format|
        if @rating.save
          flash[:error] = "La valoración se ha guardado con éxito."
          format.js { render inline: "location.reload();" }
          format.html { redirect_to vino_path(@vino) }
        else
          flash[:error] = "No se ha podido guardar su valoración debido a #{ @rating.errors.full_messages }"
          format.js { render inline: "location.reload();" }
          format.html { render @vino }
        end
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :vino_id, :valoracion)
  end
end