package com.fz.travel.bean;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
public class LineScenery {
    private Integer LineSceneryId;

    private Scenery scenery;

    private TouristLine touristLine;

    private Integer order;

    public Scenery getScenery() {
        return scenery;
    }

    public void setScenery(Scenery scenery) {
        this.scenery = scenery;
    }

    public TouristLine getTouristLine() {
        return touristLine;
    }

    public void setTouristLine(TouristLine touristLine) {
        this.touristLine = touristLine;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getLineSceneryId() {
        return LineSceneryId;
    }

    public void setLineSceneryId(Integer lineSceneryId) {
        LineSceneryId = lineSceneryId;
    }
}
