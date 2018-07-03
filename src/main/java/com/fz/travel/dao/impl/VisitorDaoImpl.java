package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;
import com.fz.travel.dao.VisitorDao;
import org.springframework.stereotype.Repository;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
@Repository
public class VisitorDaoImpl extends AbstractBaseDao<Visitor> implements VisitorDao {

    PageContainer<Visitor> pageContainer;

    @Override
    public void insertVisitor(Visitor visitor) {
        this.save(visitor);
    }

    @Override
    public Visitor selectVistorByVisitorId(Integer visitorId) {
        return get(visitorId);
    }

    @Override
    public void updateVisitor(Visitor visitor) {
        this.update(visitor);
    }

    @Override
    public PageContainer<Visitor> selectVisitorList() {
        String hql = "FROM Visitor";
        return list(hql,pageContainer);
    }

    @Override
    public PageContainer getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer pageContainer) {
        this.pageContainer = pageContainer;
    }
}
