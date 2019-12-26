class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :accounts, :role, :integer, default: 0
  end
end
