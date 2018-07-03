package org.com.vo;

/**
 * Created by wangxue on 2018/7/2.
 */
public class StringDouble implements Comparable<StringDouble>{
    String s;
    Double d;

    public StringDouble(String s, Double d){
        this.s = s;
        this.d = d;
    }

    public String getS() {
        return s;
    }

    public void setS(String s) {
        this.s = s;
    }

    public Double getD() {
        return d;
    }

    public void setD(Double d) {
        this.d = d;
    }

    @Override
    public int compareTo(StringDouble s2) {
        return this.s.compareTo(s2.s);
    }
}
