class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]

    if user && user.authenticate(params[:password])
      flash[:notice] = "Hola #{user.full_name}"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Su email o password son incorrectos."
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end