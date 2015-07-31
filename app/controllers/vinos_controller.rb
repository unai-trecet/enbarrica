class VinosController < ApplicationController
  
  def show
    @vino = Vino.find(params[:id])
    @comentarios = @vino.comentarios.order(created_at: :desc)
    @comentario = Comentario.new

    if current_user 
      @rating = Rating.find_by(vino_id: @vino.id, user_id: current_user.id) 

      unless @rating 
        @rating = Rating.new(vino_id: @vino.id, user_id: current_user.id)
      end
    end
  end

end