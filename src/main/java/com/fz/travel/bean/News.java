package com.fz.travel.bean;


import java.io.Serializable;
import java.sql.Date;

/**
 * @author: jiangjaimin
 * @date :  2018/6/28.
 */

public class News implements Serializable {

    private Integer newsId;

    private String newsType;

    private Date newsDate;

    private String newsHeadLine;

    private String newsContent;

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsType() {
        return newsType;
    }

    public void setNewsType(String newsType) {
        this.newsType = newsType;
    }

    public Date getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(Date newsDate) {
        this.newsDate = newsDate;
    }

    public String getNewsHeadLine() {
        return newsHeadLine;
    }

    public void setNewsHeadLine(String newsHeadLine) {
        this.newsHeadLine = newsHeadLine;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    @Override
    public String toString() {
        return "News{" +
                "newsId=" + newsId +
                ", newsType='" + newsType + '\'' +
                ", newsDate=" + newsDate +
                ", newsHeadLine='" + newsHeadLine + '\'' +
                ", newsContent='" + newsContent + '\'' +
                '}';
    }
}
