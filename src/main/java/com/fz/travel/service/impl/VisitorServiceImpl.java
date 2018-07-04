package com.fz.travel.service.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristLine;
import com.fz.travel.bean.Visitor;
import com.fz.travel.bean.VisitorAccount;
import com.fz.travel.dao.PageDao;
import com.fz.travel.dao.TouristLineDao;
import com.fz.travel.dao.VisitorAccountDao;
import com.fz.travel.dao.VisitorDao;
import com.fz.travel.dao.impl.AbstractBaseDao;
import com.fz.travel.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
@Service
public class VisitorServiceImpl extends AbstractBaseDao<Visitor> implements VisitorService {

    private PageContainer<Visitor> pageContainer;

    @Autowired
    private VisitorDao visitorDao;

    @Autowired
    private TouristLineDao touristLineDao;

    @Autowired
    private VisitorAccountDao visitorAccountDao;

    @Override
    public void addVisitor(Visitor visitor) {
        visitorDao.insertVisitor(visitor);
        VisitorAccount visitorAccount = visitor.getVisitorAccount();
        visitorAccount.setVisitor(visitor);
        visitorAccountDao.insertVisitorAccount(visitorAccount);
    }

    @Override
    public Visitor queryVisitorByVistorId(Integer visitorId) {
        return visitorDao.selectVistorByVisitorId(visitorId);
    }

    @Override
    public PageContainer<Visitor> queryVisitorList() {
        return visitorDao.selectVisitorList();
    }

    @Override
    public String visitorDestineTouristLine(Integer visitorId, Integer touristLineId) {
        Visitor visitor = visitorDao.selectVistorByVisitorId(visitorId);
        for(TouristLine touristLine : visitor.getTouristLineSet()){
            if(touristLine.getTouristLineId() == touristLineId){
                return "该路线已预定，不可重复预定";
            }
        }
        TouristLine touristLine = touristLineDao.selectTouristLineById(touristLineId);
        visitor.getTouristLineSet().add(touristLine);
        visitorDao.updateVisitor(visitor);
        return "预定成功";
    }

    @Override
    public PageContainer<Visitor> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer<Visitor> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
