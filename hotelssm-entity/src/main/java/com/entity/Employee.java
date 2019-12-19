package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 南八
 */
@Data
public class Employee {
    private Integer id;
    private String name;
    private String gender;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private String idcard;
    private String email;
    private String phonenumber;
    private String address;
    private String position;


}
