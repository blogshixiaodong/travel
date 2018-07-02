package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;

import com.fz.travel.bean.VisitorAccount;
import com.fz.travel.dao.VisitorAccountDao;
import org.springframework.stereotype.Repository;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
@Repository
public class VisitorAccountDaoImpl extends AbstractBaseDao<VisitorAccount> implements VisitorAccountDao {

    private PageContainer<VisitorAccount> pageContainer;

    @Override
    public void insertVisitorAccount(VisitorAccount visitorAccount) {
        this.save(visitorAccount);
    }

    @Override
    public VisitorAccount selectVisitorAccountByVisitorAccountId(Integer visitorAccountId) {
        return  this.get(visitorAccountId);
    }

    @Override
    public PageContainer<VisitorAccount> selectVisitorList() {
        String hql = "FROM Visitor";
        return this.list(hql,pageContainer);
    }

    @Override
    public PageContainer<VisitorAccount> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer<VisitorAccount> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
