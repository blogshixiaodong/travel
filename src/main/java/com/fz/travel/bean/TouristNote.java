package com.fz.travel.bean;


import java.io.Serializable;
import java.sql.Date;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class TouristNote implements Serializable {

    private Integer touristNoteId;

    private String touristNoteInfo;

    private String touristNoteHeadLine;

    private Date touristNoteTime;

    private Visitor visitor;

    public Integer getTouristNoteId() {
        return touristNoteId;
    }

    public void setTouristNoteId(Integer touristNoteId) {
        this.touristNoteId = touristNoteId;
    }

    public String getTouristNoteInfo() {
        return touristNoteInfo;
    }

    public void setTouristNoteInfo(String touristNoteInfo) {
        this.touristNoteInfo = touristNoteInfo;
    }

    public String getTouristNoteHeadLine() {
        return touristNoteHeadLine;
    }

    public void setTouristNoteHeadLine(String touristNoteHeadLine) {
        this.touristNoteHeadLine = touristNoteHeadLine;
    }

    public Date getTouristNoteTime() {
        return touristNoteTime;
    }

    public void setTouristNoteTime(Date touristNoteTime) {
        this.touristNoteTime = touristNoteTime;
    }

    public Visitor getVisitor() {
        return visitor;
    }

    public void setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }

}
