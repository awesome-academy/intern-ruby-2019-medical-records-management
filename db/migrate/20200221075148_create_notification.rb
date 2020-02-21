class CreateNotification < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.string :notification
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
