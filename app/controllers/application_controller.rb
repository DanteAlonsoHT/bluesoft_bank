class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    session[:current_user_id] ||= 1
    @current_user = User.find_by(id: session[:current_user_id])
    @users = User.all

    unless @current_user
      flash[:alert] = "Usuario no encontrado. Se ha seleccionado el usuario por defecto."
      session[:current_user_id] = User.first.id
      @current_user = User.find(session[:current_user_id])
    end
  end

  helper_method :current_user

  def current_user
    @current_user
  end
end
