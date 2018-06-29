package com.fz.travel.bean;


import java.io.Serializable;
import java.util.Set;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class TouristLine implements Serializable {

    private Integer touristLineId;

    private Double touristLinePrice;

    private Set<Scenery> scenerySet;

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

    public Set<Scenery> getScenerySet() {
        return scenerySet;
    }

    public void setScenerySet(Set<Scenery> scenerySet) {
        this.scenerySet = scenerySet;
    }

    @Override
    public String toString() {
        return "TouristLine{" +
                "touristLineId=" + touristLineId +
                ", touristLinePrice=" + touristLinePrice +
                ", scenerySet=" + scenerySet +
                '}';
    }
}
