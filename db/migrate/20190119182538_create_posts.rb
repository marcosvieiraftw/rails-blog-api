class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title, limit: 70
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
