package com.fz.travel.dao.impl;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.NewsDao;

import java.io.Serializable;

public class NewsDaoImpl extends AbstractBaseDao<News> implements NewsDao{
    private PageContainer<News> pageContainer;
    @Override
    public void insert(News news) {
       this.save(news);
    }

    @Override
    public void delete(News news) {

        this.delete(news);
    }

    @Override
    public PageContainer<News> selectAllNews() {
        String hql="select * from NEWS";
        return this.list(hql,pageContainer);
    }

    @Override
    public PageContainer<News> selectByTitle(String title){
        String hql="select * from NEWS where newsHeadLine like ?";
        String str ="%" + title+ "%,";
        return this.list(hql,pageContainer,str);
    }

    public PageContainer<News> getPageContainer() {
        return pageContainer;
    }

    public void setPageContainer(PageContainer<News> pageContainer) {
        this.pageContainer = pageContainer;
    }
}