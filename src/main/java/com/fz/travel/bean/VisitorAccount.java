package com.fz.travel.bean;

import java.io.Serializable;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class VisitorAccount implements Serializable {

    private Integer accountId;

    private String password;

    private Visitor visitor;
    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Visitor getVisitor() {
        return visitor;
    }

    public void setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }

    @Override
    public String toString() {
        return "VisitorAccount{" +
                "accountId=" + accountId +
                ", password=" + password +
                ", visitor=" + visitor +
                '}';
    }
}
