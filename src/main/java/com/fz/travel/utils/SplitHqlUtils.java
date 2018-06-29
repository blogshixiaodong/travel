package com.fz.travel.utils;

/**
 * @author: jiangjaimin
 * @date :  2018/6/29.
 */
public class SplitHqlUtils {

    public static String SplitHql(Double low, Double high, String hotelAddress, String hotelName){
        StringBuilder hql = new StringBuilder("FROM Hotel WHERE ");
        if(low != null && high != null){
            hql.append("hotelPrice BETWEEN "+low+" AND "+high+" AND ");
        }else if(low != null && high == null){
            hql.append("hotelPrice > "+low+" AND ");
        }else if(low == null && high != null){
            hql.append("hotelPrice < "+high+" AND ");
        }
        if(hotelAddress != null && !("").equals(hotelAddress)){
            hql.append("hotelAddress LIKE '%"+hotelAddress+"%' AND ");
        }
        if(hotelName != null && !("").equals(hotelName)){
            hql.append(" hotelName LIKE '%"+hotelName+"%' ");
        }
        if(hql.lastIndexOf("AND") > hql.length() - 5){
            hql.delete(hql.lastIndexOf("AND"),hql.length());
        }
        return hql.toString();
    }
}
