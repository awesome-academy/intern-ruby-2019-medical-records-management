class MedicalRecordsController < ApplicationController
  before_action :load_appointment, only: %i(new create edit)
  before_action :load_medical_record, :load_patient, only: %i(edit update)

  def new
    @medical_record = MedicalRecord.new
    @patient = @appointment.patient
  end

  def create
    @medical_record = @appointment.create_medical_record medical_record_params
    if @medical_record.save
      flash[:success] = t "medical_records_controller.success"
      redirect_to doctor_path(@appointment.doctor)
    else
      flash.now[:danger] = t "medical_records_controller.fail"
      render :new
    end
  end

  def edit; end

  def update
    if @medical_record.update_attributes medical_record_params
      flash[:success] = t "medical_records_controller.updated"
      redirect_to patient_path(@patient)
    else
      flash[:danger] = t "medical_records_controller.fail"
      render :edit
    end
  end

  private

  def medical_record_params
    params.require(:medical_record).permit MedicalRecord::MEDICAL_RECORD_PARAMS
  end

  def load_patient
    @patient = @medical_record.appointment.patient

    return if @patient
    flash.now[:danger] = t "medical_records_controller.not_found"
    redirect_to root_path
  end

  def load_medical_record
    @medical_record = MedicalRecord.find_by id: params[:id]

    return if @medical_record
    flash.now[:danger] = t "medical_records_controller.not_found"
    redirect_to root_path
  end
end
