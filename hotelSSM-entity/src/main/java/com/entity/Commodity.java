package com.entity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author 南八
 */
@Data
public class Commodity {
    Integer cid;
    String cname;
    Integer coid;
    String cunit;
    BigDecimal cprice;
    String cotype;
}
