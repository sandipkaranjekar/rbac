module Rbac
	class RoleUser < ActiveRecord::Base
		belongs_to :role
		belongs_to :user
	end
end
