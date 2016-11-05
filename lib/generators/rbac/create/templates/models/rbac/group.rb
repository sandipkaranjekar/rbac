module Rbac
	class Group < ActiveRecord::Base
		# Group - role many-to-many relationship
		has_many :roles, :through => :group_role
		has_many :group_role, dependent: :delete_all

		# Group - privilege many-to-many relationship
		has_many :privileges, :through => :group_privilege
		has_many :group_privilege, dependent: :delete_all
	end
end