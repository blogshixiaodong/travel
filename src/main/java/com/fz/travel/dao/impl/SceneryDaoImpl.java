package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Scenery;
import com.fz.travel.dao.SceneryDao;
import jdk.nashorn.internal.ir.ReturnNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
@Repository
public class SceneryDaoImpl extends AbstractBaseDao<Scenery> implements SceneryDao {

    PageContainer<Scenery> pageContainer;

    @Override
    public Long insertScenery(Scenery scenery) {
        return ((Integer)this.save(scenery)).longValue();
    }

    @Override
    public void insertSceneryList(List<Scenery> sceneryList) {
        this.save(sceneryList);
    }

    @Override
    public void updateScenery(Scenery scenery) {
        this.update(scenery);
    }

    @Override
    public void deleteScenery(Scenery scenery) {
        this.delete(scenery);
    }

    @Override
    public Scenery selectSceneryBySceneryId(Integer sceneryId) {
       return this.get(sceneryId);
    }

    @Override
    public PageContainer<Scenery> selectAllScenery() {
        String hql = "FROM Scenery";
        return this.list(hql,pageContainer);
    }

    @Override
    public PageContainer<Scenery> selectSceneryBySceneryName(String sceneryName) {
        String hql = "FORM Scenery WHERE sceneryName like ?";
        return this.list(hql,pageContainer,"%" + sceneryName + "%");
    }

    @Override
    public PageContainer<Scenery> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer<Scenery> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
