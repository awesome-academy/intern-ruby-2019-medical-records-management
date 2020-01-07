class PatientsController < ApplicationController
  def show
    @patient = Patient.find_by id: params[:id]
    return if @patient
    flash[:danger] = t "patients_controller.patient_not_found"
    redirect_to root_path
  end
end
