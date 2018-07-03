package com.fz.travel.dao.impl;

import com.fz.travel.bean.Hotel;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.bean.Visitor;
import com.fz.travel.dao.HotelDao;
import com.fz.travel.utils.SplitHqlUtils;
import org.springframework.stereotype.Repository;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
@Repository
public class HotelDaoImpl extends AbstractBaseDao<Hotel> implements HotelDao {

    PageContainer<Hotel> pageContainer;

    @Override
    public Long insertHotel(Hotel hotel) {
        return ((Integer)this.save(hotel)).longValue();
    }

    @Override
    public void deleteHotel(Hotel hotel){
        this.delete(hotel);
    }

    @Override
    public PageContainer<Hotel> selectAllHotel() {
        String hql = "FROM Hotel";
        return this.list(hql,pageContainer);
    }

    @Override
    public void updateHotel(Hotel hotel) {
        this.update(hotel);
    }

    @Override
    public PageContainer<Hotel> getPageContainer() {
        return pageContainer;
    }

    @Override
    public void setPageContainer(PageContainer<Hotel> pageContainer) {
        this.pageContainer = pageContainer;
    }

    @Override
    public Hotel selectHotelByHotelId(Integer hotelId) {
        return this.get(hotelId);
    }

    @Override
    public PageContainer<Hotel> selectHotelByConnection(Double low, Double high, String hotelAddress, String hotelName) {
        String hql = SplitHqlUtils.SplitHql(low,high,hotelAddress,hotelName);
        return this.list(hql,pageContainer);
    }

    @Override
    public PageContainer<Hotel> selectHotelByVisitorId(Integer visitorId) {
        String hql = "SELECT h FROM Hotel h LEFT JOIN h.visitorSet v WHERE v.visitorId = ? ";
        return this.list(hql,pageContainer,visitorId);
    }
}
