module ApplicationHelper
  def full_title page_title = ""
    base_title = t "application_helper.base_title"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def get_info_path
    if current_account.patient?
      patient_path(current_account)
    elsif current_account.doctor?
      doctor_path(current_account.doctor.id)
    end
  end
end
