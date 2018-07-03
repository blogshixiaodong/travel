package com.fz.travel.controller;

import com.fz.travel.bean.TouristLine;
import com.fz.travel.bean.Visitor;
import com.fz.travel.service.VisitorService;
import com.opensymphony.xwork2.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author: jiangjaimin
 * @date :  2018/7/3.
 */
@Controller
public class VisitorController extends BaseController{

    private String jsonResult = "";

    @Autowired
    private VisitorService visitorService;

    private TouristLine touristLine;

    public String visitorDestineTouristLine(){
        Visitor visitor = (Visitor) getSession().get("visitor");
        jsonResult = visitorService.visitorDestineTouristLine(visitor.getVisitorId(),touristLine.getTouristLineId());
        return Action.SUCCESS;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }

    public TouristLine getTouristLine() {
        return touristLine;
    }

    public void setTouristLine(TouristLine touristLine) {
        this.touristLine = touristLine;
    }
}
