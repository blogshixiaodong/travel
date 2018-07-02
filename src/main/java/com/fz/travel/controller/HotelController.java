package com.fz.travel.controller;

import com.fz.travel.bean.Hotel;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;
import com.fz.travel.service.HotelService;
import com.opensymphony.xwork2.Action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author: jiangjaimin
 * @date :  2018/6/30.
 */
@Controller
public class HotelController extends BaseController {

    private Double hotelLowPrice;

    private Double hotelHighPrice;

    private String jsonResult = "";

    private Hotel hotel;

    @Autowired
    private HotelService hotelService;

    private PageContainer<Hotel> pageContainer;

    //添加酒店信息
    public String createHotel(){
        hotelService.addHotel(hotel);
        return Action.SUCCESS;
    }

    public String createVisitorHotel(){
        //第二个参数为用户编号
        hotelService.addVisitorHotel(hotel.getHotelId(),2);
        jsonResult = "预定成功";
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
        this.putSessionAttribute("hotel",hotel);
        return Action.SUCCESS;
    }

    //查询所有酒店信息
    public String queryAllHotel(){
        pageContainer = hotelService.queryAllHotel(pageContainer);
        jsonResult = pageContainer.toJson("visitorSet");
        return Action.SUCCESS;
    }

    //根据条件查询(价格[低，高] 酒店名称，酒店地址)
    public String queryHotelByCondition(){
        pageContainer = hotelService.queryHotelByCondition(pageContainer,hotelLowPrice,hotelHighPrice,hotel.getHotelAddress(),hotel.getHotelName());
        jsonResult = pageContainer.toJson("visitorSet");
        return Action.SUCCESS;
    }

    private Visitor getCurrentVisitor(){
        return (Visitor) getSession().get("visitor");
    }

    public Double getHotelLowPrice() {
        return hotelLowPrice;
    }

    public void setHotelLowPrice(Double hotelLowPrice) {
        this.hotelLowPrice = hotelLowPrice;
    }

    public Double getHotelHighPrice() {
        return hotelHighPrice;
    }

    public void setHotelHighPrice(Double hotelHighPrice) {
        this.hotelHighPrice = hotelHighPrice;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public PageContainer<Hotel> getPageContainer() {
        return pageContainer;
    }

    public void setPageContainer(PageContainer<Hotel> pageContainer) {
        this.pageContainer = pageContainer;
    }
}
