class SelectDoctorsController < ApplicationController
  def index
    @select_doctor = DoctorSchedule.select_doctors params[:working_day]
  end
end
