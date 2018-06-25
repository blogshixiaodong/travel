package com.fz.travel.utils;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/**
 * @author Shixiaodong
 * @date 2018/6/25 20:18
 */
public class ReflectUtils {

    @SuppressWarnings("rawtypes")
    public static Class getClass(Class clazz) {
        Type type = clazz.getGenericSuperclass();
        if (type instanceof ParameterizedType) {
            return (Class) ((ParameterizedType) type).getActualTypeArguments()[0];
        } else {
            return null;
        }
    }
}
