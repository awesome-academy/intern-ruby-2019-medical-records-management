class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.references :account, foreign_key: true
      t.string :specialist
      t.string :image
      t.string :phone_number

      t.timestamps
    end
  end
end
