class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.string :name, limit: 50
      t.integer :code

      t.timestamps
    end
  end
end
