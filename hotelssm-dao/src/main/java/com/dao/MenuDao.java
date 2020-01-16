package com.dao;

import com.entity.Menu;

import java.util.List;

/**
 * @author 南八
 */
public interface MenuDao {
    Menu findMenuById(String id);

    List<Menu> getAllMenus();
}
