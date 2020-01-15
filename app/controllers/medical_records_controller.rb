class MedicalRecordsController < ApplicationController
  before_action :load_appointment, only: %i(new create)

  def new
    @medical_record = MedicalRecord.new
    @patient = @appointment.patient
  end

  def create
    @medical_record = @appointment.create_medical_record medical_record_params
    if @medical_record.save
      flash[:success] = t ".success"
      redirect_to doctor_path(@appointment.doctor)
    else
      flash[:danger] = t ".fail"
      render :new
    end
  end

  private

  def medical_record_params
    params.require(:medical_record).permit MedicalRecord::MEDICAL_RECORD_PARAMS
  end
end
