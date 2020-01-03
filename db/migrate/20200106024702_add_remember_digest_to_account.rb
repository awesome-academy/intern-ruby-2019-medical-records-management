class AddRememberDigestToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :remember_digest, :string
  end
end
