class RatingsController < ApplicationController
  before_filter :require_user
  
  def update
    @rating = Rating.find(params[:id])
    @vino = Vino.find(params[:vino_id])
    @rating.update_attribute(:valoracion, params[:valoracion])
    redirect_to vino_path(@vino.id)
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      redirect_to vino_path @rating.vino.id
    else
      render "vinos/show"
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :vino_id, :valoracion)
  end
end