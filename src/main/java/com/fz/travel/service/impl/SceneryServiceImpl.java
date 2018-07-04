package com.fz.travel.service.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Scenery;
import com.fz.travel.dao.SceneryDao;
import com.fz.travel.service.SceneryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
@Service
public class SceneryServiceImpl implements SceneryService {
    @Autowired
    private SceneryDao sceneryDaoImpl;

    @Override
    public Long addScenery(Scenery scenery) {
        return sceneryDaoImpl.insertScenery(scenery);
    }

    @Override
    public String updateScenery(Scenery scenery) {
        sceneryDaoImpl.updateScenery(scenery);
        return "修改成功";
    }

    @Override
    public String deleteSceneryBySceneryId(Integer sceneryId) {
        Scenery scenery = sceneryDaoImpl.selectSceneryBySceneryId(sceneryId);
        if(scenery == null){
            return "景点不存在";
        }
        if(scenery.getLineScenerySet() == null || scenery.getLineScenerySet().size() == 0){
            sceneryDaoImpl.deleteScenery(scenery);
            return "删除成功";
        }else{
            return "删除失败";
        }
    }

    @Override
    public boolean sceneryImgUpLoad(File upload, String uploadFileName) {
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            inputStream = new FileInputStream(upload);
            outputStream = new FileOutputStream("d:/images/"+uploadFileName);
            byte buffer[] = new byte[1024];
            int count = 0;
            while((count=inputStream.read(buffer)) > 0){
                outputStream.write(buffer,0,count);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                outputStream.close();
            }catch (Exception e){
                e.printStackTrace();
            }
            try {
                inputStream.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return true;
    }

    @Override
    public PageContainer<Scenery> queryAllScenery(PageContainer<Scenery> pageContainer) {
        sceneryDaoImpl.setPageContainer(pageContainer);
        return sceneryDaoImpl.selectAllScenery();
    }

    @Override
    public Scenery querySceneryBySceneryId(Integer sceneryId) {
        return sceneryDaoImpl.selectSceneryBySceneryId(sceneryId);
    }

    @Override
    public PageContainer<Scenery> querySceneryBySceneryName(PageContainer<Scenery> pageContainer,String sceneryName) {
        sceneryDaoImpl.setPageContainer(pageContainer);
        return sceneryDaoImpl.selectSceneryBySceneryName(sceneryName);
    }

    public SceneryDao getSceneryDaoImpl() {
        return sceneryDaoImpl;
    }

    public void setSceneryDaoImpl(SceneryDao sceneryDaoImpl) {
        this.sceneryDaoImpl = sceneryDaoImpl;
    }
}
