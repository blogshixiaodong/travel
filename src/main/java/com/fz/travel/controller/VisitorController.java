package com.fz.travel.controller;

import com.fz.travel.bean.TouristLine;
import com.fz.travel.bean.Visitor;
import com.fz.travel.bean.VisitorAccount;
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

    private VisitorAccount visitorAccount;

    private Visitor visitor;

    public String createVisitor(){
        visitor.setVisitorAccount(visitorAccount);
        visitorService.addVisitor(visitor);
        jsonResult = "添加成功";
        return Action.SUCCESS;
    }

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

    public VisitorAccount getVisitorAccount() {
        return visitorAccount;
    }

    public void setVisitorAccount(VisitorAccount visitorAccount) {
        this.visitorAccount = visitorAccount;
    }

    public Visitor getVisitor() {
        return visitor;
    }

    public void setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }
}
