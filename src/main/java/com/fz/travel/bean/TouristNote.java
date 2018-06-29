package com.fz.travel.bean;


import java.io.Serializable;
import java.util.Date;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class TouristNote implements Serializable {

    private Integer TouristNoteId;

    private String TouristNoteInfo;

    private String TouristNoteHeadLine;

    private Date TouristNoteTime;

    private Visitor visitor;

    public Integer getTouristNoteId() {
        return TouristNoteId;
    }

    public void setTouristNoteId(Integer touristNoteId) {
        TouristNoteId = touristNoteId;
    }

    public String getTouristNoteInfo() {
        return TouristNoteInfo;
    }

    public void setTouristNoteInfo(String touristNoteInfo) {
        TouristNoteInfo = touristNoteInfo;
    }

    public String getTouristNoteHeadLine() {
        return TouristNoteHeadLine;
    }

    public void setTouristNoteHeadLine(String touristNoteHeadLine) {
        TouristNoteHeadLine = touristNoteHeadLine;
    }

    public Date getTouristNoteTime() {
        return TouristNoteTime;
    }

    public void setTouristNoteTime(Date touristNoteTime) {
        TouristNoteTime = touristNoteTime;
    }

    public Visitor getVisitor() {
        return visitor;
    }

    public void setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }

    @Override
    public String toString() {
        return "TouristNote{" +
                "touristNoteId=" + touristNoteId +
                ", touristNoteInfo='" + touristNoteInfo + '\'' +
                ", touristNoteHeadLine='" + touristNoteHeadLine + '\'' +
                ", touristNoteTime=" + touristNoteTime +
                ", visitor=" + visitor +
                '}';
    }
}
