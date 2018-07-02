package com.fz.travel.service.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;
import com.fz.travel.dao.PageDao;
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

    @Override
    public void addVisitor(Visitor visitor) {
        visitorDao.insertVisitor(visitor);
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
    public PageContainer<Visitor> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer<Visitor> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
