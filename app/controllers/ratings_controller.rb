class RatingsController < ApplicationController
  def update
    @rating = Rating.find(params[:id])
    vino = Vino.find(params[:vino_id])
    @rating.update_attribute(:valoracion, params[:valoracion])
    binding.pry
    redirect_to vino_path(vino.id)
  end
end