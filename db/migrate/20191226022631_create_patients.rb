class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.references :account, foreign_key: true
      t.string :address
      t.datetime :birthday
      t.string :image
      t.string :phone_number

      t.timestamps
    end
  end
end
