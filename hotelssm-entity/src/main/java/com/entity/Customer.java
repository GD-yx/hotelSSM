package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 南八
 */
@Data
public class Customer {
    private Integer id;
    private String name;
    private String gender;
    private String phonenumber;
    private String address;
    private String idcard;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date checkdate;

}
