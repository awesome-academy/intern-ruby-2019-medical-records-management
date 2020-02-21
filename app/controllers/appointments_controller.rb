class AppointmentsController < ApplicationController
  before_action :require_login, only: :new
  before_action :load_doctor, only: %i(new create)

  def new
    @appointment = Appointment.new
    @working_days = DoctorSchedule.select_workingdates_by_doctor params[:doctor_id]
  end

  def create
    @working_days = DoctorSchedule.select_workingdates_by_doctor @params
    @appointment = current_patient.appointments.build \
      appointment_params.merge(doctor_id: params[:doctor_id])
    if @appointment.save
      notify
      flash[:success] = "Book successful"
      redirect_to current_account.patient
    else
      render :new
    end
  end

  def show; end

  private

  def appointment_params
    params.require(:appointment).permit Appointment::APPOINTMENT_PARAMS
  end

  def load_doctor
    return unless params[:doctor_id].present?
    @doctor = Doctor.find_by id: params[:doctor_id]

    return if @doctor
    flash[:danger] = t "doctors_controller.doctor_not_found"
    redirect_to doctors_path
  end

  def notify
    current_patient.notifications.create notification: noti_content, doctor_id: params[:doctor_id]
  end

  def noti_content
    t("appointments_controller.noti_content", patient_name: current_account.name, doctor_name: @doctor.name)
  end
end
