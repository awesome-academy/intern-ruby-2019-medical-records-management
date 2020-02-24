class SelectDoctorsController < ApplicationController
  def index
    @select_doctors =DoctorSchedule.select_doctors(params[:working_day]).collect{|doc_sch| [doc_sch.name, doc_sch.id]}
  end
end
