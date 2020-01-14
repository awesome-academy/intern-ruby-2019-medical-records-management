class AccountsController < ApplicationController
  before_action :require_login, only: :show
  before_action :load_account, only: :show

  def new
    @account = Account.new
  end

  def create
    @account = Account.new account_params
    if @account.save
      login @account
      flash[:success] = t "accounts_controller.signup_success"
      redirect_to @account
    else
      render :new
    end
  end

  def show; end

  private

  def account_params
    params.require(:account).permit Account::ACCOUNT_PARAMS
  end
end
