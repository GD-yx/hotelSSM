package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 南八
 */
@Data
public class Unsettled {
    private Integer id;
    private Integer roomid;
    private String roomtype;
    private String name;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date checkdate;

    private Double consume;
    private Double money;

}
