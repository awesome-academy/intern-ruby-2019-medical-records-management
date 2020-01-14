class AppointmentsController < ApplicationController
  before_action :require_login, only: :new

  def new
    @appointment = Appointment.new
  end

  def create
    doctor_id = params[:doctor_id]
    @appointment = current_patient.appointments.build \
      appointment_params.merge(doctor_id: doctor_id)
    if @appointment.save
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
end
