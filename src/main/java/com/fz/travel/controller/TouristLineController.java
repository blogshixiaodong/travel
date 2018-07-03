package com.fz.travel.controller;

import com.fz.travel.bean.*;
import com.fz.travel.service.LineSceneryService;
import com.fz.travel.service.SceneryService;
import com.fz.travel.service.TouristLineService;
import com.fz.travel.utils.JsonUtils;
import com.opensymphony.xwork2.Action;
import net.sf.json.JSONArray;

import net.sf.json.JsonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.sound.sampled.Line;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/7/1 23:24
 */
@Controller
public class TouristLineController extends BaseController {

    private String jsonResult = "";

    private TouristLine touristLine;

    private PageContainer<TouristLine> pageContainer;

    private List<Integer> sceneryIds;

    @Autowired
    private TouristLineService touristLineService;

    @Autowired
    private LineSceneryService lineSceneryService;

    @Autowired
    private SceneryService sceneryService;

    public TouristLineController() {
    }

    public String addTouristLine() {
        Integer touristLineId = touristLineService.saveTouristLine(touristLine);
        touristLine.setTouristLineId(touristLineId);
        for(int i = 0; i < sceneryIds.size(); i++) {
            Scenery scenery = sceneryService.querySceneryBySceneryId(sceneryIds.get(i));
            if(scenery == null) {
                return Action.SUCCESS;
            }
            LineScenery lineScenery = new LineScenery();
            lineScenery.setTouristLine(touristLine);
            lineScenery.setScenery(scenery);
            lineScenery.setSequence(i);
            lineSceneryService.addLineScenery(lineScenery);
        }
        return Action.SUCCESS;
    }

    public String removeTouristLine() {
        touristLine = touristLineService.queryTouristLineById(touristLine.getTouristLineId());
        if(touristLine.getLineScenerySet() != null && touristLine.getLineScenerySet().size() != 0) {
            jsonResult = "已存在相关约束，不能删除该线路.";
            return Action.SUCCESS;
        }
        touristLineService.deleteTouristLine(touristLine);
        return Action.SUCCESS;
    }

    public String updateTouristLine() {
        //删除的景点
        List<LineScenery> deleteLineScenery = new ArrayList<>();

        touristLine = touristLineService.queryTouristLineById(touristLine.getTouristLineId());

        LineScenery lineScenery = null;
        Iterator<LineScenery> iterable = touristLine.getLineScenerySet().iterator();
        while(iterable.hasNext()) {
            lineScenery = iterable.next();
            if(isContaineSceneryIds(lineScenery.getScenery().getSceneryId())) {
                continue;
            }
            //不在Set中说明在前端被删除
            //iterable.remove();
            deleteLineScenery.add(lineScenery);

        }
        //更新线路基本信息
        //touristLineService.updateTouristLine(touristLine);
        //更新景点信息
        doUpdateLineScenery(touristLine, deleteLineScenery);
        return Action.SUCCESS;
    }

    private void doUpdateLineScenery(TouristLine touristLine, List<LineScenery> deleteLineScenery) {
        //删除
        for(LineScenery lineScenery : deleteLineScenery) {
            lineSceneryService.deleteLineScenery(lineScenery);
        }
        //添加
        int orderIndex = touristLine.getLineScenerySet().size();
        List<Integer> newLineScenery = getNewSceneryIds(touristLine);
        for(Integer sceneryId : newLineScenery) {

            Scenery scenery = new Scenery();
            scenery.setSceneryId(sceneryId);

            LineScenery lineScenery = new LineScenery();
            lineScenery.setSequence(orderIndex++);
            lineScenery.setScenery(scenery);
            lineScenery.setTouristLine(touristLine);

            lineSceneryService.addLineScenery(lineScenery);
        }
    }


    //线路中的景点在前端的数据中不存在，则被删除
    private boolean isContaineSceneryIds(Integer sceneryId) {
        return sceneryIds.contains(sceneryId);
    }

    //获取新增的景点
    private List<Integer> getNewSceneryIds(TouristLine touristLine) {
        List<Integer> newSceneryIds = new ArrayList<>();
        List<Integer> localSceneryIds = new ArrayList<>();

        Iterator<LineScenery> iterable = touristLine.getLineScenerySet().iterator();
        while(iterable.hasNext()) {
            LineScenery lineScenery = iterable.next();
            sceneryIds.add(lineScenery.getScenery().getSceneryId());
        }

        //前端传递景点id在线路中不存在
        for(int i = 0; i < sceneryIds.size(); i++) {
            if(localSceneryIds.contains(sceneryIds.get(i)) == false) {
                newSceneryIds.add(sceneryIds.get(i));
            }
        }
        return newSceneryIds;
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

    public String findLineSceneryByTouristLineName() {
        pageContainer = touristLineService.queryTouristLineByName(touristLine.getTouristLineName(), pageContainer);
        jsonResult = pageContainer.toJson("lineScenerySet","visitorSet");
        return Action.SUCCESS;
    }

    public String findTouristLineList() {
        pageContainer = touristLineService.queryTouristLineList(pageContainer);
        jsonResult = pageContainer.toJson("lineScenerySet","visitorSet");
        return Action.SUCCESS;
    }

    public String findTouristLineListByVisitorId(){
        Visitor visitor = (Visitor) getSession().get("visitor");
        if(visitor == null){
            return Action.ERROR;
        }
        pageContainer = touristLineService.queryTouristLineListByVisitorId(pageContainer,visitor.getVisitorId());
        jsonResult = pageContainer.toJson("lineScenerySet","visitorSet");
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

    public List<Integer> getSceneryIds() {
        return sceneryIds;
    }

    public void setSceneryIds(List<Integer> sceneryIds) {
        this.sceneryIds = sceneryIds;
    }
}
