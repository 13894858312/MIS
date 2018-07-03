package org.com.tools;

import org.com.vo.StringDouble;
import org.com.vo.StringLong;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 * Created by wangxue on 2018/7/2.
 */
public class Help {

    public static ArrayList<StringLong> sl2Array(HashMap<String,Long> map){
        Set<String> set = map.keySet();

        ArrayList<StringLong> result = new ArrayList<>();
        for(String s:set){
            Long l = map.get(s);
            StringLong sl = new StringLong(s, l);
            result.add(sl);
        }

        return result;
    }

    public static ArrayList<StringDouble> sd2Array(HashMap<String,Double> map){
        Set<String> set = map.keySet();
        ArrayList<StringDouble> result = new ArrayList<>();
        for(String s:set){
            Double d = map.get(s);
            StringDouble sd = new StringDouble(s, d);
            result.add(sd);
        }
        return result;
    }

}
