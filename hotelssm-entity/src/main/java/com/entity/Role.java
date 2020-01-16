package com.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author 南八
 */
@Data
@AllArgsConstructor
public class Role {
    private String id;
    private String name;
    private String description;
    public Role() {}
}
