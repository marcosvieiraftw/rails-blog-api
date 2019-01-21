class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :user_role, foreign_key: true
      t.string :name, limit: 60
      t.string :email, limit: 60
      t.string :password_digest, limit: 72
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
