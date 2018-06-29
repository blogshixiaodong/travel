package com.fz.travel.controller;

import com.fz.travel.bean.News;
import com.fz.travel.service.NewsService;
import org.springframework.stereotype.Controller;

@Controller
public class NewsController extends BaseController {
    private News news;

    private NewsService newsService;
}
