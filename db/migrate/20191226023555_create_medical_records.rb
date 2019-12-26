class CreateMedicalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_records do |t|
      t.references :appointment, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
