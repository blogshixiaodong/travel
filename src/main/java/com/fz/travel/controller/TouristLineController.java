package com.fz.travel.controller;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristLine;
import com.fz.travel.service.TouristLineService;
import com.opensymphony.xwork2.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Shixiaodong
 * @date 2018/7/1 23:24
 */
@Controller
public class TouristLineController extends BaseController {

    String jsonResult = "";

    private TouristLine touristLine;

    private PageContainer<TouristLine> pageContainer;

    @Autowired
    private TouristLineService touristLineService;

    public String findTouristLineListById() {
        touristLine = touristLineService.queryTouristLineById(touristLine.getTouristLineId());
        putSessionAttribute("touristLine", touristLine);
        return Action.SUCCESS;
    }

    public String findTouristLineList() {
        pageContainer = touristLineService.queryTouristLineList(pageContainer);
        jsonResult = pageContainer.toJson("lineScenerySet");
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

    public PageContainer<TouristLine> getPageContainer() {
        return pageContainer;
    }

    public void setPageContainer(PageContainer<TouristLine> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
