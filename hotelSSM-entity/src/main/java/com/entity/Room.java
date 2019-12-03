package com.entity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author 南八
 */
@Data
public class Room {
    Integer roomid;
    Integer rtype;
    String status;
    BigDecimal rprice;
    String remark;
    String rtname;

}
