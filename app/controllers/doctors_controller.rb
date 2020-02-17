class DoctorsController < ApplicationController
  def index
    @q = Account.doctor.ransack params[:q]
    @doctors = @q.result.page(params[:page]).per Settings.per_page
  end

  def show
    @doctor = Doctor.find_by id: params[:id]
    @appointments = @doctor.appointments
    return if @doctor
    flash[:danger] = t "doctors_controller.doctor_not_found"
    redirect_to root_path
  end
end
