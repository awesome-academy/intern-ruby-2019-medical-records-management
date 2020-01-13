class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_login
    return if logged_in?

    flash[:danger] = t "application_controller.must_logged_in"
    redirect_to login_url
  end

  def load_account
    @account = Account.find_by id: params[:id]

    return if @account

    flash[:danger] = t "application_controller.account_not_found"
    redirect_to root_path
  end

  def current_patient
    current_account.patient
  end

  def load_appointment
    @appointment = Appointment.find_by id: params[:appointment_id]
  end
end
