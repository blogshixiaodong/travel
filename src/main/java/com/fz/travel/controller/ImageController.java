package com.fz.travel.controller;

import com.opensymphony.xwork2.Action;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import java.io.FileInputStream;
import java.io.IOException;


/**
 * @author: jiangjaimin
 * @date :  2018/7/4.
 */
@Controller
public class ImageController {

    private String name;

    private FileInputStream imageStream = null;

    public String getImage() {

        try{
            imageStream = new FileInputStream("D:/images/" + name); // 以byte流的方式打开文件 d:\1.gif
            ServletActionContext.getContext().put("imageStream", imageStream);
        } catch(Exception e){
            e.printStackTrace();
            System.out.println("图片不存在");
        } finally {

        }
        return Action.SUCCESS;
    }

    public FileInputStream getImageStream() {
        return imageStream;
    }

    public void setImageStream(FileInputStream imageStream) {
        this.imageStream = imageStream;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
