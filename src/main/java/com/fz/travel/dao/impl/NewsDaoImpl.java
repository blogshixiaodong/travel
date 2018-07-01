package com.fz.travel.dao.impl;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.NewsDao;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public class NewsDaoImpl extends AbstractBaseDao<News> implements NewsDao{
    private PageContainer<News> pageContainer;
    @Override
    public void insert(News news) {
       this.save(news);
    }

    @Override
    public void deleteByNews(News news) {

        this.delete(news);
    }

    @Override
    public PageContainer<News> selectAllNews() {
        String hql="FROM News";
        return this.list(hql,pageContainer);
    }

    @Override
    public PageContainer<News> selectByHeadLine(String headLine){
        String hql = "FROM News where newsHeadLine like ?";
        return this.list(hql, pageContainer, "%" + headLine + "%");
    }

    @Override
    public PageContainer<News> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer pageContainer) {
          this.pageContainer=pageContainer;
    }
}