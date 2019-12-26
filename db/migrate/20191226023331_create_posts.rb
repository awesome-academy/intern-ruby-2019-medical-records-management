class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :account, foreign_key: true
      t.string :title
      t.text :content
      t.date :publish_at

      t.timestamps
    end
  end
end
