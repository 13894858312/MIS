package org.com.vo;

/**
 * Created by wangxue on 2018/7/2.
 */
public class StringLong implements Comparable<StringLong> {
    String s;
    Long l;

    public StringLong(String s, Long l){
        this.s = s;
        this.l = l;
    }

    public String getS() {
        return s;
    }

    public void setS(String s) {
        this.s = s;
    }

    public Long getL() {
        return l;
    }

    public void setL(Long l) {
        this.l = l;
    }

    @Override
    public int compareTo(StringLong s2) {
        if(this.s.length()!=s2.s.length()){
            return this.s.length()-s2.s.length();
        }
        return this.s.compareTo(s2.s);
    }
}
