package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 南八
 */
@Data
public class Settled {
    private Integer id;
    private Integer roomid;
    private String roomtype;
    private String name;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date checkdate;
    private Double consume;

}
