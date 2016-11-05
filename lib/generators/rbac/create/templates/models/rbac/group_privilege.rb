module Rbac
	class GroupPrivilege < ActiveRecord::Base
		belongs_to :group 
		belongs_to :privilege
	end
end
