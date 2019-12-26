class CreateDoctorSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_schedules do |t|
      t.references :doctor, foreign_key: true
      t.integer :working_day

      t.timestamps
    end
  end
end
