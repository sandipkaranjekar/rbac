class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users, :id => false do |t|
      t.references :role
      t.references :user
    end
  end
end
