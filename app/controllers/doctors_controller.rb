class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find_by id: params[:id]
    @appointments = @doctor.appointments
    return if @doctor
    flash[:danger] = t "doctors_controller.doctor_not_found"
    redirect_to root_path
  end
end
