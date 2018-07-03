package org.com.service;

import org.com.model.Account;

import java.util.HashMap;

/**
 * Created by wangxue on 2018/6/29.
 */
public interface AccountService {

    public boolean login(Account account);

    public boolean register(Account account);

    public boolean modify(Account account);

    public Account getAccountInfo(int uid);

    public HashMap<String, Long> getMonthlyUserNum();

    public long getTotalUserNum();

    public long getActiveUserNum(int year, int month);

    public HashMap<String, Long> getMonthlyActiveNum();

    public HashMap<String, Long> getAreaOrderNum(int uid);

    public HashMap<String, Long> getAreaTurnover(int uid);

    public HashMap<String, Long> getPeriodTurnover(int uid);

    public HashMap<String, Long> getPeriodTurnover(int year, int uid);

    public HashMap<String, Long> getPeriodOrderNum(int uid);

    public HashMap<String, Long> getPeriodOrderNum(int year, int uid);

    public long getToMonthTurnover(int year, int month , int uid);

    public long getTotalOrderNum(int uid);

    public long getTotalTurnover(int uid);

    public long[] getUserTypeOrder(int uid);

    public long getRegisterUserNum(int year, int month);

    public HashMap<String,Long> getUserSectionOrderNum(int uid);
}
