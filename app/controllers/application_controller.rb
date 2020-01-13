class ApplicationController < ActionController::Base
  before_action :set_dropdown_categories
  helper_method :current_user, :logged_in?

  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "Você deve estar logado para executar isso"
      redirect_to root_path
    end
  end

  def set_dropdown_categories
    @dropdown_categories = Category.all
  end

end
