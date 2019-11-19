package com.mrlv.api.utils;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.mrlv.api.constant.SocketCode;

import java.util.HashMap;

public class SocketSendUtils {

    /**
     * 根据 socketCode 分别返回 json
     * @param code
     * @param value
     * @return
     */
    public static String sendJson(SocketCode code, String value){
        HashMap<Object, Object> map = Maps.newHashMap();
        map.put("code", code.getCode());
        switch (code){
            case EVENT_MESSAGE:
                map.put("eventId", value);
                break;
            case EVENT_MESSAGE_REFRESH:
            case PUSH_MESSAGE:
                break;
            case REFRESH_PAGE:
                map.put("page", value);
                break;
            case HEARTBEAT:
            case EXECUTE_ERROR:
            case INIT_ERROR:
                map.put("msg", value);
                break;
            default:
                return value;
        }
        return JSONObject.toJSONString(map);
    }
}
