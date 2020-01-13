class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      flash[:success] = "Login realizado com sucesso"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Algo de errado com suas informações de login. Por favor, tente novamente."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Desconectado com sucesso"
    redirect_to root_path
  end

end