module ApplicationHelper
  def full_title page_title = ""
    base_title = t "application_helper.base_title"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def get_info_path
    return patient_path(current_account) if current_account.patient?
    return doctor_path(current_account.doctor.id) if current_account.doctor?
  end

  def current_doctor? doctor_id
    current_account.doctor? && doctor_id == current_account.doctor_id
  end

  def select_doctors_workingdays
    @working_days.pluck(:working_day).map{|a| a.strftime(Settings.date_format)}
  end
end
