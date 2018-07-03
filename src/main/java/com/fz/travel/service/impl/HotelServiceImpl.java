package com.fz.travel.service.impl;

import com.fz.travel.bean.Hotel;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;
import com.fz.travel.dao.HotelDao;
import com.fz.travel.dao.VisitorDao;
import com.fz.travel.service.HotelService;
import com.sun.org.apache.bcel.internal.generic.GOTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
@Service
public class HotelServiceImpl implements HotelService {

    @Autowired
    private HotelDao hotelDaoImpl;

    @Autowired
    private VisitorDao visitorDaoImpl;

    @Override
    public Long addHotel(Hotel hotel) {
        return hotelDaoImpl.insertHotel(hotel);
    }

    @Override
    public void addVisitorHotel(Integer hotelId, Integer visitorId) {
        Hotel hotel = hotelDaoImpl.selectHotelByHotelId(hotelId);
        Visitor visitor = visitorDaoImpl.selectVistorByVisitorId(visitorId);
        hotel.getVisitorSet().add(visitor);
        hotelDaoImpl.updateHotel(hotel);
    }

    @Override
    public String deleteHotelByHotelId(Integer hotelId) {
        Hotel hotel = hotelDaoImpl.selectHotelByHotelId(hotelId);
        if(hotel == null){
            return "酒店不存在";
        }
        //查询一下预定表中是否有存在预定
        if(hotel.getVisitorSet() == null || hotel.getVisitorSet().isEmpty()){
            hotelDaoImpl.deleteHotel(hotel);
            return "删除成功";
        }else{
            return "存在住户,删除失败";
        }
    }

    @Override
    public String updateHotel(Hotel hotel) {
        if( "".equals(hotel.getHotelName()) || "".equals(hotel.getHotelAddress()) || "".equals(hotel.getHotelPrice()) || "".equals(hotel.getHotelIntroduce()) || "".equals(hotel.getHotelPhone())  ){
            return "修改失败";
        }
        hotelDaoImpl.updateHotel(hotel);
        return "修改成功";
    }

    @Override
    public PageContainer<Hotel> queryAllHotel(PageContainer<Hotel> pageContainer) {
        hotelDaoImpl.setPageContainer(pageContainer);
        return hotelDaoImpl.selectAllHotel();
    }

    @Override
    public Hotel queryHotelByHotelId(Integer hotelId) {
        return hotelDaoImpl.selectHotelByHotelId(hotelId);
    }

    @Override
    public PageContainer<Hotel> queryHotelByCondition(PageContainer<Hotel> pageContainer, Double low, Double high, String hotelAddress, String hotelName) {
        if(low == null && high == null && "".equals(hotelAddress) && "".equals(hotelName) ){
            return null;
        }
        hotelDaoImpl.setPageContainer(pageContainer);
        return hotelDaoImpl.selectHotelByConnection(low,high,hotelAddress,hotelName);
    }
}
