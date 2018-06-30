package com.fz.travel.controller;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Scenery;
import com.fz.travel.service.SceneryService;
import com.opensymphony.xwork2.Action;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author: jiangjaimin
 * @date :  2018/6/30.
 */
@Controller
public class SceneryController extends BaseController {
    @Autowired
    private SceneryService sceneryService;

    private Scenery scenery;

    private String jsonResult = "";

    private PageContainer<Scenery> pageContainer;

    //添加景点信息
    public String createScenery(){
        sceneryService.addScenery(scenery);
        return Action.SUCCESS;
    }

    //删除酒店信息
    public String deleteSceneryBySceneryId(){
        sceneryService.deleteSceneryBySceneryId(scenery.getSceneryId());
        return Action.SUCCESS;
    }

    //修改酒店信息
    public String updateSceney(){
        sceneryService.updateScenery(scenery);
        return Action.SUCCESS;
    }

    //根据景点编号查询景点信息
    public String querySceneryBySceneryId(){
        scenery = sceneryService.querySceneryBySceneryId(scenery.getSceneryId());
        jsonResult = JSONObject.fromObject(scenery).toString();
        return Action.SUCCESS;
    }

    //查询所有景点信息
    public String queryAllScenery(){
        pageContainer = sceneryService.queryAllScenery(pageContainer);
        jsonResult = JSONObject.fromObject(pageContainer).toString();
        return Action.SUCCESS;
    }
}
