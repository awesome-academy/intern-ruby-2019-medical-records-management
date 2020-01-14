class ChangecolumnWorkingDay < ActiveRecord::Migration[5.2]
  def change
    change_column :doctor_schedules, :working_day, :date
  end
end
