package com.fz.travel.utils;

import net.sf.json.JsonConfig;

/**
 * @author Shixiaodong
 * @date 2018/7/1 0:26
 */
public class JsonUtils {

    public static JsonConfig JsonExclude(String... properties) {
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(properties);
        return jsonConfig;
    }

}


