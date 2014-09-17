package com.shareku.service;

import java.util.List;

import com.shareku.entity.Menu;

public interface MenuService {
	public List<Menu> listAllMenu();
	public List<Menu> listAllParentMenu();
	public List<Menu> listSubMenuByParentId(Integer parentId);
	public Menu getMenuById(Integer menuId);
	public void saveMenu(Menu menu);
	public void deleteMenuById(Integer menuId);
	public List<Menu> listAllSubMenu();
}
