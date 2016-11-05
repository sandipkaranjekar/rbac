class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.text :role_description
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
