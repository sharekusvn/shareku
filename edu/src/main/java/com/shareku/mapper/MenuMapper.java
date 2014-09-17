package com.shareku.mapper;

import java.util.List;

import com.shareku.entity.Menu;

public interface MenuMapper {
	List<Menu> listAllParentMenu();
	List<Menu> listSubMenuByParentId(Integer parentId);
	Menu getMenuById(Integer menuId);
	void insertMenu(Menu menu);
	void updateMenu(Menu menu);
	void deleteMenuById(Integer menuId);
	List<Menu> listAllSubMenu();
}
