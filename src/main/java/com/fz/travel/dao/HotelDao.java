package com.fz.travel.dao;


import com.fz.travel.bean.Hotel;
import com.fz.travel.bean.PageContainer;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
public interface HotelDao extends PageDao<Hotel> {
    /*
    * @Description:添加酒店
    * @param :  [hotel]
    * @return : java.lang.Long
    */
    Long insertHotel(Hotel hotel);

    /*
    * @Description:删除酒店
    * @param :  [hotel]
    * @return : void
    */
    void deleteHotel(Hotel hotel);

    /*
    * @Description:查询所有酒店信息
    * @return :PageContainer<Hotel>
    */
    PageContainer<Hotel> selectAllHotel();

    /*
    * @Description:修改酒店信息
    * @param :  [hotel]
    * @return : void
    */
    void updateHotel(Hotel hotel);

    /*
    * @Description:根据酒店编号查询酒店信息
    * @param :  [hotelId]
    * @return : Hotel
    */
    Hotel selectHotelByHotelId(Integer hotelId);

    /*
    * @Description:根据条件查询酒店信息
    * @param :  [low, high, hotelAddress, hotelName]
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Hotel>
    */
    PageContainer<Hotel> selectHotelByConnection(Double low,Double high,String hotelAddress,String hotelName);

    /*
    * @Description:根据用户编号查询用户预定的酒店
    * @param :  [visitorId]
    * @return : com.fz.travel.bean.PageContainer<com.fz.travel.bean.Hotel>
    */
    PageContainer<Hotel> selectHotelByVisitorId(Integer visitorId);


}
