class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_login
    return if logged_in?

    flash[:danger] = t "application_controller.must_logged_in"
    redirect_to login_url
  end
end
