module Rbac
	class RoleUser < ActiveRecord::Base
		belongs_to :role, class_name: 'Rbac::Role'
		belongs_to :user, class_name: 'User'
	end
end
