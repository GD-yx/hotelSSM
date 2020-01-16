package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sun.istack.internal.Nullable;
import lombok.Data;

import java.util.Date;

/**
 * @author 南八
 */
@Data
public class Consume {


    private Integer id;
    private Integer roomid;
    private String name;
    private String cname;
    private String cunit;
    private Double cprice;
    private Integer number;
    private Double money;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date consumedate;
}
