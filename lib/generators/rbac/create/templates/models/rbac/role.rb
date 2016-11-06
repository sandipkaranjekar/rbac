module Rbac
	class Role < ActiveRecord::Base
		# User - user many-to-many relationship
		has_many :users, :through => :role_user, class_name: 'User'
		has_many :role_user, dependent: :delete_all, class_name: 'Rbac::RoleUser'

		# Group - role many-to-many relationship
		has_many :groups, :through => :group_role
		has_many :group_role, dependent: :delete_all
	end
end
