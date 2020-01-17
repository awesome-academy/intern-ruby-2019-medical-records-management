class PatientsController < ApplicationController
  def index
    @patients_searched = Account.patient.search_by_name(params[:search])
    @patients = @patients_searched.page(params[:page]).per Settings.per_page
  end

  def show
    @patient = Patient.find_by id: params[:id]
    @appointments = @patient.appointments
    @medical_records = @patient.medical_records

    return if @patient
    flash[:danger] = t "patients_controller.patient_not_found"
    redirect_to root_path
  end
end
