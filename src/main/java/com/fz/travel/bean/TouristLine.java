package com.fz.travel.bean;


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class TouristLine implements Serializable {

    private Integer touristLineId;

    private Double touristLinePrice;

    private String touristLineName;

    private Set<Visitor> visitorSet = new HashSet<Visitor>();

    private Set<LineScenery> lineScenerySet = new HashSet<LineScenery>();

    public Integer getTouristLineId() {
        return touristLineId;
    }

    public void setTouristLineId(Integer touristLineId) {
        this.touristLineId = touristLineId;
    }

    public Double getTouristLinePrice() {
        return touristLinePrice;
    }

    public void setTouristLinePrice(Double touristLinePrice) {
        this.touristLinePrice = touristLinePrice;
    }

    public String getTouristLineName() {
        return touristLineName;
    }

    public void setTouristLineName(String touristLineName) {
        this.touristLineName = touristLineName;
    }

    public Set<LineScenery> getLineScenerySet() {
        return lineScenerySet;
    }

    public void setLineScenerySet(Set<LineScenery> lineScenerySet) {
        this.lineScenerySet = lineScenerySet;
    }

    public Set<Visitor> getVisitorSet() {
        return visitorSet;
    }

    public void setVisitorSet(Set<Visitor> visitorSet) {
        this.visitorSet = visitorSet;
    }

    @Override
    public String toString() {
        return "TouristLine{" +
                "touristLineId=" + touristLineId +
                ", touristLinePrice=" + touristLinePrice +
                '}';
    }
}
