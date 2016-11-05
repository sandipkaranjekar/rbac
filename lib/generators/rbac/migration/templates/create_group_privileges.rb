class CreateGroupPrivileges < ActiveRecord::Migration
  def change
    create_table :group_privileges, :id => false do |t|
      t.references :group
      t.references :privilege
    end
  end
end
