package com.fz.travel.service.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristLine;
import com.fz.travel.dao.TouristLineDao;
import com.fz.travel.service.TouristLineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;

/**
 * @author Shixiaodong
 * @date 2018/7/1 23:07
 */
@Service
public class ToutistLineServiceImpl implements TouristLineService {

    @Autowired
    private TouristLineDao touristLineDao;

    @Override
    public Integer saveTouristLine(TouristLine touristLine) {
        return touristLineDao.insertTouristLine(touristLine);
    }

    @Override
    public void updateTouristLine(TouristLine touristLine) {
        touristLineDao.updateTouristLine(touristLine);
    }

    @Override
    public void deleteTouristLine(TouristLine touristLine) {
        touristLineDao.deleteTouristLine(touristLine);
    }

    @Override
    public TouristLine queryTouristLineById(Serializable touristLineId) {
        return touristLineDao.selectTouristLineById(touristLineId);
    }

    @Override
    public PageContainer<TouristLine> queryTouristLineByName(String touristLineName, PageContainer<TouristLine> pageContainer) {
        touristLineDao.setPageContainer(pageContainer);
        return touristLineDao.selectTouristLineByName(touristLineName);
    }

    @Override
    public PageContainer<TouristLine> queryTouristLineList(PageContainer<TouristLine> pageContainer) {
        touristLineDao.setPageContainer(pageContainer);
        return touristLineDao.selectTouristLineList();
    }

    @Override
    public PageContainer<TouristLine> queryTouristLineListByVisitorId(PageContainer<TouristLine> pageContainer, Integer visitorId) {
        touristLineDao.setPageContainer(pageContainer);
        return touristLineDao.selectTouristLineListByVisitorId(visitorId);
    }
}
