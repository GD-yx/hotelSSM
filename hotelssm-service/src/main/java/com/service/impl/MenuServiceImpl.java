package com.service.impl;

import com.dao.MenuDao;
import com.entity.Menu;
import com.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 南八
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao dao;

    @Override
    public Menu findMenuById(String id) {
        return dao.findMenuById(id);
    }

    @Override
    public List<Menu> getAllMenus() {
        return dao.getAllMenus();
    }
}
