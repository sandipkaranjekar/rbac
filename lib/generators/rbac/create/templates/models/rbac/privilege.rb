module Rbac
	class Privilege < ActiveRecord::Base
		# Privilege - group many-to-many relationship
		has_many :groups, :through => :group_privilege
		has_many :group_privilege, dependent: :delete_all
	end
end
