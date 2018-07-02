package com.fz.travel.bean;


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class Hotel implements Serializable {

    private int hotelId;

    private String hotelName;

    private String hotelPhone;

    private String hotelIntroduce;

    private Double hotelPrice;

    private String hotelAddress;

    private Set<Visitor> visitorSet = new HashSet<Visitor>();

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getHotelPhone() {
        return hotelPhone;
    }

    public void setHotelPhone(String hotelPhone) {
        this.hotelPhone = hotelPhone;
    }

    public String getHotelIntroduce() {
        return hotelIntroduce;
    }

    public void setHotelIntroduce(String hotelIntroduce) {
        this.hotelIntroduce = hotelIntroduce;
    }

    public Double getHotelPrice() {
        return hotelPrice;
    }

    public void setHotelPrice(Double hotelPrice) {
        this.hotelPrice = hotelPrice;
    }

    public String getHotelAddress() {
        return hotelAddress;
    }

    public void setHotelAddress(String hotelAddress) {
        this.hotelAddress = hotelAddress;
    }

    public Set<Visitor> getVisitorSet() {
        return visitorSet;
    }

    public void setVisitorSet(Set<Visitor> visitorSet) {
        this.visitorSet = visitorSet;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "hotelId=" + hotelId +
                ", hotelName='" + hotelName + '\'' +
                ", hotelPhone='" + hotelPhone + '\'' +
                ", hotelIntroduce='" + hotelIntroduce + '\'' +
                ", hotelPrice=" + hotelPrice +
                ", hotelAddress='" + hotelAddress + '\'' +
                '}';
    }
}
