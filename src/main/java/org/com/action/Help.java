package org.com.action;

import org.com.vo.StringLong;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 * Created by wangxue on 2018/7/2.
 */
public class Help {

    public static ArrayList<StringLong> toArray(HashMap<String,Long> map){
        Set<String> set = map.keySet();

        ArrayList<StringLong> result = new ArrayList<>();
        for(String s:set){
            Long l = map.get(s);
            StringLong sl = new StringLong(s, l);
            result.add(sl);
        }

        return result;
    }
}
