package com.fz.travel.controller;

import com.fz.travel.bean.News;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.TouristNote;
import com.fz.travel.bean.Visitor;
import com.fz.travel.service.NewsService;
import com.fz.travel.service.TouristNoteService;
import com.opensymphony.xwork2.Action;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.Date;

@Controller
public class NewsController extends BaseController {
    private News news;

    private String jsonResult = "";

    private PageContainer<News> pageContainer;

    @Autowired
    private NewsService newsService;

    //添加新闻
    public String createNews(){
        Date date = new Date();
        news.setNewsDate(date);
        newsService.addNews(news);
        return Action.SUCCESS;
    }

    //删除新闻
    public String deleteNewsByNewsId(){
        newsService.removeByNews(news.getNewsId());
        return Action.SUCCESS;
    }
    //更改新闻
    public String updateNews(){
        News news1 = newsService.queryByNewsId(news.getNewsId());
        news.setNewsType(news1.getNewsType());
        news.setNewsDate(news1.getNewsDate());
        newsService.updateNews(news);
        return Action.SUCCESS;
    }

    //按新闻标题
    public String queryNewsByNewsHeadLine(){
        System.out.println(news.getNewsHeadLine());
        pageContainer = newsService.queryByHeadLine(news.getNewsHeadLine(),pageContainer);
        System.out.println(pageContainer.getList());
        jsonResult = pageContainer.toJson("newsSet");
        return Action.SUCCESS;
    }

    //按新闻ID查询
    public String queryNewsByNewsId(){
        News news1 = newsService.queryByNewsId(news.getNewsId());
        putSessionAttribute("news",news1);
        return  Action.SUCCESS;
    }

    //显示所有新闻
    public String queryAllNews(){
        pageContainer = newsService.queryAllNews(pageContainer);
        jsonResult = pageContainer.toJson("newsSet");
        return Action.SUCCESS;
    }

    //get and set
    public News getNews() { return news; }

    public void setNews(News news) {
        this.news = news;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }

    public PageContainer<News> getPageContainer() {
        return pageContainer;
    }

    public void setPageContainer(PageContainer<News> pageContainer) {
        this.pageContainer = pageContainer;
    }

}
