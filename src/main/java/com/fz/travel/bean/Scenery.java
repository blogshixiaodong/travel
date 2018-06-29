package com.fz.travel.bean;


import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class Scenery implements Serializable {

    private Integer sceneryId;

    private String sceneryPhoto;

    private Double sceneryPrice;

    private String sceneryIntroduce;

    private String sceneryName;

    private Date sceneryOpenTime;

    private Set<LineScenery> lineScenerySet;

    public Integer getSceneryId() {
        return sceneryId;
    }

    public void setSceneryId(Integer sceneryId) {
        this.sceneryId = sceneryId;
    }

    public String getSceneryPhoto() {
        return sceneryPhoto;
    }

    public void setSceneryPhoto(String sceneryPhoto) {
        this.sceneryPhoto = sceneryPhoto;
    }

    public Double getSceneryPrice() {
        return sceneryPrice;
    }

    public void setSceneryPrice(Double sceneryPrice) {
        this.sceneryPrice = sceneryPrice;
    }

    public String getSceneryIntroduce() {
        return sceneryIntroduce;
    }

    public void setSceneryIntroduce(String sceneryIntroduce) {
        this.sceneryIntroduce = sceneryIntroduce;
    }

    public String getSceneryName() {
        return sceneryName;
    }

    public void setSceneryName(String sceneryName) {
        this.sceneryName = sceneryName;
    }

    public Date getSceneryOpenTime() {
        return sceneryOpenTime;
    }

    public void setSceneryOpenTime(Date sceneryOpenTime) {
        this.sceneryOpenTime = sceneryOpenTime;
    }

    public Set<LineScenery> getLineScenerySet() {
        return lineScenerySet;
    }

    public void setLineScenerySet(Set<LineScenery> lineScenerySet) {
        this.lineScenerySet = lineScenerySet;
    }

    @Override
    public String toString() {
        return "Scenery{" +
                "sceneryId=" + sceneryId +
                ", sceneryPhoto='" + sceneryPhoto + '\'' +
                ", sceneryPrice=" + sceneryPrice +
                ", sceneryIntroduce='" + sceneryIntroduce + '\'' +
                ", sceneryName='" + sceneryName + '\'' +
                ", sceneryOpenTime=" + sceneryOpenTime +
                '}';
    }

}
