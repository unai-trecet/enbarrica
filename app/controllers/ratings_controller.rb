class RatingsController < ApplicationController
  before_filter :require_user
  respond_to :html, :js
  
  def update
    @rating = Rating.find(params[:id])
    @vino = @rating.vino
    @rating.update_attribute(:valoracion, params[:valoracion])
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