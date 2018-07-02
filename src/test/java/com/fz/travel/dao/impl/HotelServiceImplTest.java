package com.fz.travel.dao.impl;

import com.fz.travel.bean.Hotel;
import com.fz.travel.bean.PageContainer;
import com.fz.travel.service.HotelService;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;
import org.springframework.context.ApplicationContext;
import org.springframework.context.HierarchicalMessageSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/** 
* HotelServiceImpl Tester. 
* 
* @author:jiangjiamin
* @since <pre>���� 29, 2018</pre> 
* @version 1.0 
*/ 
public class HotelServiceImplTest { 
    private ApplicationContext ctx;
    private HotelService hotelService;

    @Before
    public void before() throws Exception { 
        ctx = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        hotelService = (HotelService) ctx.getBean("hotelServiceImpl");
    } 

    @After
    public void after() throws Exception { 
    
    } 

    @Test
    public void testAddHotel() throws Exception {
        Hotel hotel = new Hotel();
        hotel.setHotelAddress("beijing");
        hotel.setHotelIntroduce("beijingbei");
        hotel.setHotelName("beihotel");
        hotel.setHotelPhone("123456");
        hotel.setHotelPrice(15.0);
        hotelService.addHotel(hotel);

    } 
    @Test
    public void testDeleteHotelByHotelId() throws Exception {
        hotelService.deleteHotelByHotelId(5);
    } 
    @Test
    public void testUpdateHotel() throws Exception {
        Hotel hotel = new Hotel();
        hotel.setHotelId(5);
        hotel.setHotelAddress("xiamen");
        hotel.setHotelIntroduce("xiamenbei");
        hotel.setHotelName("xioahotel");
        hotel.setHotelPhone("147852");
        hotel.setHotelPrice(30.0);
        hotelService.updateHotel(hotel);
    } 
    @Test
    public void testQueryAllHotel() throws Exception {
        PageContainer<Hotel> pageContainer = new PageContainer<Hotel>();
        pageContainer.setCurrentPageNo(1);
        pageContainer = hotelService.queryAllHotel(pageContainer);
        System.out.println(pageContainer.getList());
    } 
    @Test
    public void testQueryHotelByHotelId() throws Exception { 
        Hotel hotel = hotelService.queryHotelByHotelId(5);
        System.out.println(hotel);
    }
    @Test
    public void testQueryHotelByCondition(){
        PageContainer pageContainer = new PageContainer();
        pageContainer.setCurrentPageNo(1);
        Double low = null;
        Double high = null;
        String hotelAddress = "j";
        String hotelName = null;
        pageContainer =hotelService.queryHotelByCondition(pageContainer,low,high,hotelAddress,hotelName);
        System.out.println(pageContainer.getList());
    }

} 
