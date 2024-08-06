class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :deposit, :withdraw]

  def index
    @accounts = Account.where(user_id: @current_user)
    session[:current_user_id] ||= 1
  end

  def show
  end

  def deposit
    if @account.deposit(params[:amount].to_f)
      flash[:notice] = 'Depósito exitoso.'
    else
      flash[:alert] = 'Error al realizar el depósito.'
    end
    redirect_to @account
  end

  def withdraw
    if @account.withdraw(params[:amount].to_f, params[:location])
      flash[:notice] = 'Retiro exitoso.'
    else
      flash[:alert] = 'Error al realizar el retiro.'
    end
    redirect_to @account
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
end
