package com.fz.travel.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class Visitor implements Serializable {

    private Integer visitorId;

    private String visitorGender;

    private String visitorPhone;

    private Date visitorDate;

    private Set<Hotel> hotelSet;

    private Set<TouristNote> touristNoteSet;

    private Set<TouristLine> touristLineSet;

    private Set<Message> messageSet;

    private VisitorAccount visitorAccount;

    public Integer getVisitorId() {
        return visitorId;
    }

    public void setVisitorId(Integer visitorId) {
        this.visitorId = visitorId;
    }

    public String getVisitorGender() {
        return visitorGender;
    }

    public void setVisitorGender(String visitorGender) {
        this.visitorGender = visitorGender;
    }

    public String getVisitorPhone() {
        return visitorPhone;
    }

    public void setVisitorPhone(String visitorPhone) {
        this.visitorPhone = visitorPhone;
    }

    public Date getVisitorDate() {
        return visitorDate;
    }

    public void setVisitorDate(Date visitorDate) {
        this.visitorDate = visitorDate;
    }

    public Set<Hotel> getHotelSet() {
        return hotelSet;
    }

    public void setHotelSet(Set<Hotel> hotelSet) {
        this.hotelSet = hotelSet;
    }

    public Set<TouristNote> getTouristNoteSet() {
        return touristNoteSet;
    }

    public void setTouristNoteSet(Set<TouristNote> touristNoteSet) {
        this.touristNoteSet = touristNoteSet;
    }

    public Set<TouristLine> getTouristLineSet() {
        return touristLineSet;
    }

    public void setTouristLineSet(Set<TouristLine> touristLineSet) {
        this.touristLineSet = touristLineSet;
    }

    public Set<Message> getMessageSet() {
        return messageSet;
    }

    public void setMessageSet(Set<Message> messageSet) {
        this.messageSet = messageSet;
    }

    public VisitorAccount getVisitorAccount() {
        return visitorAccount;
    }

    public void setVisitorAccount(VisitorAccount visitorAccount) {
        this.visitorAccount = visitorAccount;
    }
}
