class UsersController < ApplicationController
  def change_user
    session[:current_user_id] = params[:user_id]
    redirect_to accounts_path
  end
end
