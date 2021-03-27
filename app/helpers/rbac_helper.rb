module RbacHelper

  def action_permissions_list(resource_name)
    resource_name?(resource_name).permissions_list
  end
  
  def resource_name?(resource_name)
    current_user.role.permissions.where(resource_name: resource_name).last
  end
end