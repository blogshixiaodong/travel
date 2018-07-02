package com.fz.travel.controller;

import com.fz.travel.bean.Hotel;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.service.HotelService;
import com.opensymphony.xwork2.Action;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author: jiangjaimin
 * @date :  2018/6/30.
 */
@Controller
public class HotelController extends BaseController {
    @Autowired
    private HotelService hotelService;

    private Hotel hotel;

    private String jsonResult = "";

    private PageContainer<Hotel> pageContainer;

    private Double low;

    private Double high;

    //添加酒店信息
    public String createHotel(){
        hotelService.addHotel(hotel);
        return Action.SUCCESS;
    }

    //删除酒店信息
    public String deleteHotelByHotelId(){
        hotelService.deleteHotelByHotelId(hotel.getHotelId());
        return Action.SUCCESS;
    }

    //修改酒店信息
    public String updateHotel(){
        hotelService.updateHotel(hotel);
        return Action.SUCCESS;
    }

    //根据酒店编号查询酒店信息
    public String queryHotelByHotelId(){
        hotel =  hotelService.queryHotelByHotelId(hotel.getHotelId());
        jsonResult = JSONObject.fromObject(hotel).toString();
        return Action.SUCCESS;
    }

    //查询所有酒店信息
    public String queryAllHotel(){
        pageContainer = hotelService.queryAllHotel(pageContainer);
        jsonResult = JSONObject.fromObject(pageContainer).toString();
        return Action.SUCCESS;
    }

    //根据条件查询(价格[低，高] 酒店名称，酒店地址)
    public String queryHotelByCondition(){
        pageContainer = hotelService.queryHotelByCondition(pageContainer,low,high,hotel.getHotelName(),hotel.getHotelAddress());
        jsonResult = JSONObject.fromObject(pageContainer).toString();
        return Action.SUCCESS;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public HotelService getHotelService() {
        return hotelService;
    }

    public void setHotelService(HotelService hotelService) {
        this.hotelService = hotelService;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }
}
