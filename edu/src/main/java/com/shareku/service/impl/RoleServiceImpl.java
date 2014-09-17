package com.shareku.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shareku.entity.Role;
import com.shareku.mapper.RoleMapper;
import com.shareku.service.RoleService;

public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	
	public List<Role> listAllRoles() {
		// TODO Auto-generated method stub
		return roleMapper.listAllRoles();
	}

	public void deleteRoleById(int roleId) {
		// TODO Auto-generated method stub
		roleMapper.deleteRoleById(roleId);
	}

	public Role getRoleById(int roleId) {
		// TODO Auto-generated method stub
		return roleMapper.getRoleById(roleId);
	}

	public boolean insertRole(Role role) {
		// TODO Auto-generated method stub
		if(roleMapper.getCountByName(role)>0)
			return false;
		else{
			roleMapper.insertRole(role);
			return true;
		}
	}

	public boolean updateRoleBaseInfo(Role role) {
		// TODO Auto-generated method stub
		if(roleMapper.getCountByName(role)>0)
			return false;
		else{
			roleMapper.updateRoleBaseInfo(role);
			return true;
		}
	}
	
	public void updateRoleRights(Role role) {
		// TODO Auto-generated method stub
		roleMapper.updateRoleRights(role);
	}

}
