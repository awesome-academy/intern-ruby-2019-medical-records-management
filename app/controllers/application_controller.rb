class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper
  before_action :load_noti_user

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

  def load_noti_user
    return unless logged_in? && current_account.doctor?
    @notifications = current_doctor.notifications.order_by_create
  end

  def render_notification notification
    ApplicationController.renderer.render partial: "notifications/notification", locals: {notification: notification}
  end
end
