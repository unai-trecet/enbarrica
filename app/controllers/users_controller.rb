class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "#{ @user.full_name }, tu usuario se ha creado con éxito."
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end