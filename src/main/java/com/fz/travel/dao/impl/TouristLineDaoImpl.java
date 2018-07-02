package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristLine;
import com.fz.travel.dao.TouristLineDao;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

/**
 * @author Shixiaodong
 * @date 2018/6/29 21:24
 */
@Repository
public class TouristLineDaoImpl extends AbstractBaseDao<TouristLine> implements TouristLineDao {

    private PageContainer<TouristLine> pageContainer;

    @Override
    public Integer insertTouristLine(TouristLine touristLine) {
        return Integer.parseInt(this.save(touristLine).toString());
    }

    @Override
    public void deleteTouristLine(TouristLine touristLine) {
        this.delete(touristLine);
    }

    @Override
    public void updateTouristLine(TouristLine touristLine) {
        this.update(touristLine);
    }

    @Override
    public TouristLine selectTouristLineById(Serializable touristLineId) {
        return this.get(touristLineId);
    }

    @Override
    public PageContainer<TouristLine> selectTouristLineList() {
        String hql = "FROM TouristLine";
        return this.list(hql, pageContainer);
    }

    @Override
    public PageContainer<TouristLine> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer<TouristLine> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
