package com.fz.travel.controller;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristLine;
import com.fz.travel.service.TouristLineService;
import com.fz.travel.utils.JsonUtils;
import com.opensymphony.xwork2.Action;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.json.JSONUtil;
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

    public String removeTouristLine() {
        touristLine = touristLineService.queryTouristLineById(touristLine.getTouristLineId());
        if(touristLine.getLineScenerySet() != null && touristLine.getLineScenerySet().size() != 0) {
            jsonResult = "已存在相关约束，不能删除改线路.";
            return Action.SUCCESS;
        }
        touristLineService.deleteTouristLine(touristLine);
        return Action.SUCCESS;
    }

    public String findTouristLineListById() {
        touristLine = touristLineService.queryTouristLineById(touristLine.getTouristLineId());
        putSessionAttribute("touristLine", touristLine);
        return Action.SUCCESS;
    }

    public String findLineSceneryByTouristLineId() {
        touristLine = touristLineService.queryTouristLineById(touristLine.getTouristLineId());
        JsonConfig jsonConfig = JsonUtils.JsonExclude("lineScenerySet", "touristLine");
        jsonResult = JSONArray.fromObject(touristLine.getLineScenerySet(), jsonConfig).toString();
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
