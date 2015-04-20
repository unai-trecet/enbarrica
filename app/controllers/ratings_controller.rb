class RatingsController < ApplicationController
  before_filter :require_user
  
  def update
    @rating = Rating.find(params[:id])
    @rating.update_attribute(:valoracion, params[:valoracion])
    redirect_to vino_path @rating.vino.id
  end

  def create
    @rating = Rating.new(rating_params)

    unless current_user.has_rated_vino? @rating.vino
      if @rating.save
        redirect_to vino_path @rating.vino.id
      else
        flash[:error] = "No se ha podido guardar su valoración debido a #{ @rating.errors.full_messages }"
        render "vinos/show"
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :vino_id, :valoracion)
  end
end