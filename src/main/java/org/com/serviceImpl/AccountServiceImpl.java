package org.com.serviceImpl;

import org.com.dao.AccountDao;
import org.com.model.Account;
import org.com.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by wangxue on 2018/6/29.
 */
@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Override
    public boolean login(Account account){
        return accountDao.checkAccount(account);
    }

    @Override
    public boolean register(Account account){

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        account.setLogDate(java.sql.Date.valueOf(simpleDateFormat.format(date)));

        return accountDao.addAccount(account);
    }

    @Override
    public boolean modify(Account account) {
        return accountDao.modifyAccount(account);
    }

    @Override
    public Account getAccountInfo(int uid) {
        return accountDao.getInfo(uid);
    }

    @Override
    public HashMap<String, Long> getMonthlyUserNum() {
        return accountDao.getMonthlyAnalysis();
    }

    @Override
    public long getTotalUserNum() {
        return accountDao.getUserNum();
    }

    @Override
    public long getActiveUserNum(int year, int month) {
        return accountDao.getActiveUserNum(year,month);
    }

    @Override
    public HashMap<String, Long> getMonthlyActiveNum() {
        return accountDao.getMonthlyActiveNum();
    }

    @Override
    public HashMap<String, Long> getAreaOrderNum(int uid) {
        return accountDao.getUserAreaOrder(uid);
    }

    @Override
    public HashMap<String, Long> getAreaTurnover(int uid) {
        return accountDao.getUserAreaTurnover(uid);
    }

    @Override
    public HashMap<String, Long> getPeriodTurnover(int uid) {
        return accountDao.getUserPeriodTurnover(uid);
    }

    @Override
    public HashMap<String, Long> getPeriodTurnover(int year, int uid) {
        return accountDao.getUserPeriodTurnover(year,uid);
    }

    @Override
    public HashMap<String, Long> getPeriodOrderNum(int uid) {
        return accountDao.getUserPeriodOrder(uid);
    }

    @Override
    public HashMap<String, Long> getPeriodOrderNum(int year, int uid) {
        return accountDao.getUserPeriodOrder(year,uid);
    }

    @Override
    public long getToMonthTurnover(int year, int month, int uid) {
        return accountDao.getUserTurnover(year, month, uid);
    }

    @Override
    public long getTotalOrderNum(int uid) {
        return accountDao.getUserTotalOrder(uid);
    }

    @Override
    public long getTotalTurnover(int uid) {
        return accountDao.getUserTotalTurnover(uid);
    }

    @Override
    public long[] getUserTypeOrder(int uid) {
        return accountDao.getUserTypeOrder(uid);
    }

    @Override
    public long getRegisterUserNum(int year, int month) {
        return accountDao.getRegisterUserNum(year, month);
    }
}
