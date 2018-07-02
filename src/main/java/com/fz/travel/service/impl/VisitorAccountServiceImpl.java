package com.fz.travel.service.impl;

import com.fz.travel.bean.PageContainer;

import com.fz.travel.bean.Visitor;
import com.fz.travel.bean.VisitorAccount;
import com.fz.travel.dao.VisitorAccountDao;
import com.fz.travel.service.VisitorAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: jiangjaimin
 * @date :  2018/7/2.
 */
@Service
public class VisitorAccountServiceImpl implements VisitorAccountService {
    @Autowired
    private VisitorAccountDao visitorAccountDao;

    @Override
    public void addVisitorAccount(VisitorAccount visitorAccount) {
        visitorAccountDao.insertVisitorAccount(visitorAccount);
    }

    @Override
    public VisitorAccount queryVisitorAccountByVisitorAccountId(Integer visitorAccountId) {
        return visitorAccountDao.selectVisitorAccountByVisitorAccountId(visitorAccountId);
    }

    @Override
    public PageContainer<VisitorAccount> queryVisitorAccountList() {
        return visitorAccountDao.selectVisitorList();
    }

    @Override
    public Visitor visitorAccountLoginCheck(VisitorAccount visitorAccount) {
        VisitorAccount checkVisitorAccount = visitorAccountDao.selectVisitorAccountByVisitorAccountId(visitorAccount.getAccountId());
        if("".equals(visitorAccount.getAccountId()) || "".equals(visitorAccount.getPassword())){
            return null;
        }
        if(checkVisitorAccount.getPassword().equals(visitorAccount.getPassword())){
            return checkVisitorAccount.getVisitor();
        }
        return null;
    }
}
