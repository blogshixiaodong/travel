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

    public Set<LineScenery> getLineScenerySet() {
        return lineScenerySet;
    }

    public void setLineScenerySet(Set<LineScenery> lineScenerySet) {
        this.lineScenerySet = lineScenerySet;
    }
}
