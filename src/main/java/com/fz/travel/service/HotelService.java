package com.fz.travel.service;

import com.fz.travel.bean.Hotel;
import com.fz.travel.bean.PageContainer;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
public interface HotelService {
    /*
    * @Description:添加酒店信息
    * @param :  [hotel]
    * @return : java.lang.Long
    */
    Long addHotel(Hotel hotel);

    /*
    * @Description:添加酒店预定信息(中间表)
    * @param :  [hotelId, visitorId]
    * @return : void
    */
    void addVisitorHotel(Integer hotelId,Integer visitorId);

    /*
    * @Description:根据酒店编号删除酒店信息
    * @param :  [hotelId]
    * @return : java.lang.String
    */
    String deleteHotelByHotelId(Integer hotelId);

    /*
    * @Description:修改酒店信息
    * @param :  [hotel]
    * @return : void
    */
    String updateHotel(Hotel hotel);

    /*
    * @Description:查询所有酒店信息
    * @param :  [pageContainer]
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Hotel>
    */
    PageContainer<Hotel> queryAllHotel(PageContainer<Hotel> pageContainer);

    /*
    * @Description:根据酒店编号查询某个酒店具体信息
    * @param :  [hotelId]
    * @return : com.fz.travel.bean.Hotel
    */
    Hotel queryHotelByHotelId(Integer hotelId);

    /*
    * @Description:根据条件查询酒店信息
    * @param :  [pageContainer, low, high, hotelAddress, hotelName]
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Hotel>
    */
    PageContainer<Hotel> queryHotelByCondition(PageContainer<Hotel> pageContainer,Double low,Double high,String hotelAddress,String hotelName);

    /*
    * @Description:根据用户编号查询用户预定酒店
    * @param :  [pageContainer, visitorId]
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Hotel>
    */
    PageContainer<Hotel> queryHotelByVisitorId(PageContainer<Hotel> pageContainer,Integer visitorId);

}
