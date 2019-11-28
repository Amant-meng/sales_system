package com.ccut.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ccut.entity.RoleMenu;
import com.ccut.repository.RoleMenuRepository;
import com.ccut.service.RoleMenuService;

/**
 * 角色权限菜单关联Service实现类
 * @author Meng.Yang
 *
 */
@Service("roleMenuService")
@Transactional
public class RoleMenuServiceImpl implements RoleMenuService{

	@Resource
	private RoleMenuRepository roleMenuRepository;

	@Override
	public void deleteByRoleId(Integer roleId) {
		roleMenuRepository.deleteByRoleId(roleId);
	}

	@Override
	public void save(RoleMenu roleMenu) {
		roleMenuRepository.save(roleMenu);
	}


}
