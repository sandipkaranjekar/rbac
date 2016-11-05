module Rbac
	module ApplicationHelper
		def has_permission(user, controller, action)
      role_ids_arr = user.role_ids
      role_ids_arr.each do |role_id|
        group = Rbac::Role.find(role_id).group_ids
        group.each do |group_id|
          privilage_data = Rbac::Group.find(group_id).privileges
          if privilage_data.detect{|privilage|
                privilage.controller == controller && privilage.action == action
             }
             return true
          else
             return false 
          end
        end #end of group id loop
      end #end of role id loop
	  end
	end
end