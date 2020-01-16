package com.service;

import com.entity.Menu;

import java.util.List;

/**
 * @author 南八
 */
public interface MenuService {
    Menu findMenuById(String id);

    List<Menu> getAllMenus();
}
