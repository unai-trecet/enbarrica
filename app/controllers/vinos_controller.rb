class VinosController < ApplicationController
  
  def show
    @vino = Vino.find(params[:id])
    @comentarios = @vino.comentarios.order(created_at: :desc)
    
    if current_user 
      @lists = current_user.lists 
      @comentario = Comentario.new
      @rating = Rating.find_by(vino_id: @vino.id, user_id: current_user.id) 

      unless @rating 
        @rating = Rating.new(vino_id: @vino.id, user_id: current_user.id)
      end
    end
  end

end