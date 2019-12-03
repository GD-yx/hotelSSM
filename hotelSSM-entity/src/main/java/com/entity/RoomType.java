package com.entity;

public class RoomType {
    Integer rtid;
    String rtname;

    @Override
    public String toString() {
        return "RoomType{" +
                "rtid=" + rtid +
                ", rtname='" + rtname + '\'' +
                '}';
    }

    public RoomType() {
    }

    public RoomType(Integer rtid, String rtname) {
        this.rtid = rtid;
        this.rtname = rtname;
    }

    public Integer getRtid() {
        return rtid;
    }

    public void setRtid(Integer rtid) {
        this.rtid = rtid;
    }

    public String getRtname() {
        return rtname;
    }

    public void setRtname(String rtname) {
        this.rtname = rtname;
    }
}
