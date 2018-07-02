package com.fz.travel.controller;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;

import com.fz.travel.bean.Visitor;
import com.fz.travel.service.TouristNoteService;
import com.opensymphony.xwork2.Action;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Shixiaodong
 * @date 2018/6/29 8:51
 */
@Controller
public class TouristNoteController extends BaseController {

    private String jsonResult = "";

    private TouristNote touristNote;

    private Visitor visitor;

    private PageContainer<TouristNote> pageContainer;

    @Autowired
    private TouristNoteService touristNoteService;

    //添加旅游游记
    String createTouristNote(){
        touristNoteService.saveTouristNote(touristNote);
        return Action.SUCCESS;
    }

    //根据游记标题查询游记
    String findTouristNoteListByHeadLine(){
        touristNoteService.queryTouristNoteListByHeadLine(touristNote.getTouristNoteHeadLine(),pageContainer);
        return Action.SUCCESS;
    }

    //根据用户编号查询该用户的旅游游记
    String findTouristNoteListByVisitorId(){
        pageContainer = touristNoteService.queryTouristNoteListByVisitorId(visitor.getVisitorId(),pageContainer);
        jsonResult = JSONObject.fromObject(pageContainer).toString();
        return Action.SUCCESS;
    }

    //根据用户编号和发布日期查询该用户的旅游游记
    String findTouristNoteListByVisitorIdAndDate(){
        pageContainer = touristNoteService.queryTouristNoteListByVisitorIdAndDate(visitor.getVisitorId(),touristNote.getTouristNoteTime(),pageContainer);
        jsonResult = JSONObject.fromObject(pageContainer).toString();
        return Action.SUCCESS;
    }

    //根据发布时间查询旅游游记
    String findTouristNoteListByDate(){
        pageContainer = touristNoteService.queryTouristNoteListByDate(touristNote.getTouristNoteTime(),pageContainer);
        jsonResult = JSONObject.fromObject(pageContainer).toString();
        return Action.SUCCESS;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }

    public TouristNote getTouristNote() {
        return touristNote;
    }

    public void setTouristNote(TouristNote touristNote) {
        this.touristNote = touristNote;
    }

    public Visitor getVisitor() {
        return visitor;
    }

    public void setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }
}
