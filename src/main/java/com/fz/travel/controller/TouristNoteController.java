package com.fz.travel.controller;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;

import com.fz.travel.bean.Visitor;
import com.fz.travel.service.TouristNoteService;
import com.fz.travel.utils.JsonUtils;
import com.opensymphony.xwork2.Action;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
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
    public String createTouristNote() {
        touristNoteService.saveTouristNote(touristNote);
        return Action.SUCCESS;
    }

    public String findTouristNoteById() {
        touristNoteService.queryTouristNoteById(touristNote.getTouristNoteId());
        return Action.SUCCESS;
    }

    //无条件查询
    public String findTouristNoteList() {
        pageContainer = touristNoteService.queryTouristNoteList(pageContainer);
        jsonResult = pageContainer.toJson("hotelSet", "touristNoteSet", "touristLineSet", "messageSet", "visitorAccount");
        return Action.SUCCESS;
    }

    //根据游记标题查询游记
    public String findTouristNoteListByHeadLine() {
        pageContainer = touristNoteService.queryTouristNoteListByHeadLine(touristNote.getTouristNoteHeadLine(), pageContainer);
        jsonResult = pageContainer.toJson("hotelSet", "touristNoteSet", "touristLineSet", "messageSet", "visitorAccount");
        //JsonConfig jsonConfig = JsonUtils.JsonExclude("hotelSet", "touristNoteSet", "touristLineSet", "messageSet", "visitorAccount");
        //jsonResult = JSONObject.fromObject(pageContainer, jsonConfig).toString();
        return Action.SUCCESS;
    }

    //根据用户编号查询该用户的旅游游记
    public String findTouristNoteListByVisitorId() {
        pageContainer = touristNoteService.queryTouristNoteListByVisitorId(visitor.getVisitorId(),pageContainer);
        jsonResult = JSONObject.fromObject(pageContainer).toString();
        return Action.SUCCESS;
    }

    //根据用户编号和发布日期查询该用户的旅游游记
    public String findTouristNoteListByVisitorIdAndDate() {
        pageContainer = touristNoteService.queryTouristNoteListByVisitorIdAndDate(visitor.getVisitorId(),touristNote.getTouristNoteTime(),pageContainer);
        jsonResult = JSONObject.fromObject(pageContainer).toString();
        return Action.SUCCESS;
    }

    //根据发布时间查询旅游游记
    public String findTouristNoteListByDate(){
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

    public PageContainer<TouristNote> getPageContainer() {
        return pageContainer;
    }

    public void setPageContainer(PageContainer<TouristNote> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
