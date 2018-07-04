package com.fz.travel.controller;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Scenery;
import com.fz.travel.service.SceneryService;

import com.opensymphony.xwork2.Action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.File;

/**
 * @author: jiangjaimin
 * @date :  2018/6/30.
 */
@Controller
public class SceneryController extends BaseController {

    private String jsonResult = "";

    private Scenery scenery;

    private PageContainer<Scenery> pageContainer;

    private File upload;

    private String uploadFileName;

    @Autowired
    private SceneryService sceneryService;

    //添加景点信息
    public String createScenery(){
        uploadImgRename();//重置上传文件名
        sceneryService.sceneryImgUpLoad(upload,uploadFileName);
        scenery.setSceneryPhoto(uploadFileName);
        sceneryService.addScenery(scenery);
        jsonResult = "添加成功";
        return Action.SUCCESS;
    }

    //删除酒店信息
    public String deleteSceneryBySceneryId(){
        jsonResult = sceneryService.deleteSceneryBySceneryId(scenery.getSceneryId());
        return Action.SUCCESS;
    }

    //修改酒店信息
    public String updateSceney(){
        jsonResult = sceneryService.updateScenery(scenery);
        return Action.SUCCESS;
    }

    //根据景点编号查询景点信息
    public String querySceneryBySceneryId(){
        scenery = sceneryService.querySceneryBySceneryId(scenery.getSceneryId());
        putSessionAttribute("scenery",scenery);
        return Action.SUCCESS;
    }

    //根据景点名称查询景点
    public String querySceneryBySceneryName() {
        pageContainer = sceneryService.querySceneryBySceneryName(pageContainer, scenery.getSceneryName());
        jsonResult = pageContainer.toJson("lineScenerySet");
        return Action.SUCCESS;
    }

    //查询所有景点信息
    public String queryAllScenery(){
        pageContainer = sceneryService.queryAllScenery(pageContainer);
        jsonResult = pageContainer.toJson("lineScenerySet");
        return Action.SUCCESS;
    }

    private void uploadImgRename(){
        String suffix = uploadFileName.split("\\.")[1];
        uploadFileName = scenery.getSceneryName()+"."+suffix;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }

    public Scenery getScenery() {
        return scenery;
    }

    public void setScenery(Scenery scenery) {
        this.scenery = scenery;
    }

    public PageContainer<Scenery> getPageContainer() {
        return pageContainer;
    }

    public void setPageContainer(PageContainer<Scenery> pageContainer) {
        this.pageContainer = pageContainer;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }
}
