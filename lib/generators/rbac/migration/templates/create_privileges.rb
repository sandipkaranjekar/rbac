class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string :name
      t.text :description
      t.string :controller
      t.string :action
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
