package com.entity;

import lombok.Data;

/**
 * @author 南八
 */
@Data
public class Menu {
    private String id;
    private String name;
    private String uri;
    private Boolean parent;
    private Integer pid;
}
