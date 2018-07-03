package org.com.daoImpl;

import org.com.dao.AccountDao;
import org.com.model.Account;
import org.com.tools.TYPE;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

/**
 * Created by wangxue on 2018/6/6.
 */
@Repository
@Transactional(readOnly = false)
public class AccountDaoImpl implements AccountDao {

    private HibernateTemplate template;
    private Data data;

    @Autowired
    public AccountDaoImpl(SessionFactory sessionFactory) {
        this.template = new HibernateTemplate(sessionFactory);
        this.data = new Data(template);
    }

    @Override
    public boolean addAccount(Account account) {

        try {
            template.save(account);
        }catch (Exception e){
            System.out.println("账号 "+account.getUid()+" 插入错误");
            return false;
        }
        return true;
    }

    @Override
    public boolean modifyAccount(Account account) {

        try {
            template.update(account);
        }catch (Exception e){
            System.out.println("账号 "+account.getUid()+" 修改错误");
            return false;
        }
        return true;
    }

    @Override
    public boolean checkAccount(Account account) {
        int uid = account.getUid();
        Account a_in_db = (Account)template.get(Account.class, uid);

        if(a_in_db == null) {
            return false;
        }

        return a_in_db.getPwd().equals(account.getPwd()) && (a_in_db.getType()==account.getType());
    }

    @Override
    public Account getInfo(int uid) {
        return (Account)template.get(Account.class, uid);
    }

    @Override
    public HashMap<String, Long> getMonthlyAnalysis() {
        String hql = "select year(a.logDate) as year, month(a.logDate) as month, count(uid) as num from Account a group by year(a.logDate), month(a.logDate)";
        List<Object[]> query = (List<Object[]>) template.find(hql);
        HashMap<String, Long> result = new HashMap<>();
        for(Object[] r : query){
            String s = r[0]+"-"+r[1];
            result.put(s, (long)r[2]);
        }
        return result;
    }

    @Override
    public long getUserNum() {
        return (Long)template.find("select count(*) from Account a where a.type=0").get(0);
    }

    @Override
    public long getActiveUserNum(int year, int month) {
        String hql = "select count(distinct o.uid) from Orders o where o.state<>3 and year(o.ctime)=? and month(o.ctime)=?";
        return (Long)template.find(hql, year, month).get(0);
    }

    @Override
    public HashMap<String, Long> getMonthlyActiveNum() {
        String hql = "select year(o.ctime) as year, month(o.ctime) as month, count(distinct uid) as num from Orders o group by year(o.ctime), month(o.ctime)";
        List<Object[]> query = (List<Object[]>) template.find(hql);
        HashMap<String, Long> result = new HashMap<>();
        for(Object[] r : query){
            String s = r[0]+"-"+r[1];
            result.put(s, (long)r[2]);
        }

        return result;
    }

    @Override
    public HashMap<String, Long> getUserAreaOrder(int uid) {
        String sql = "select h.city, count(o.oid) from Hotel h right join Orders o ON h.hid=o.hid where o.state<>3 and o.uid=? group by h.city";
        List<Object[]> list = (List<Object[]>) template.find(sql,uid);
        HashMap<String, Long> result = new HashMap<>();
        for(Object[] l :list){
            result.put((String)l[0],(long)l[1]);
        }
        return result;
    }

    @Override
    public HashMap<String, Long> getUserAreaTurnover(int uid) {
        String sql = "select h.city, sum(o.money) from Hotel h right join Orders o ON h.hid=o.hid where o.state<>3 and o.uid=? group by h.city";
        List<Object[]> list = (List<Object[]>) template.find(sql,uid);
        HashMap<String, Long> result = new HashMap<>();
        for(Object[] l :list){
            result.put((String)l[0],(long)l[1]);
        }
        return result;
    }

    @Override
    public HashMap<String, Long> getUserPeriodTurnover(int uid) {
        return data.periodTurnoverQueryHelper(TYPE.USER, uid);
    }

    @Override
    public HashMap<String, Long> getUserPeriodTurnover(int year, int uid) {
        return data.periodTurnoverQueryHelper(year,TYPE.USER,uid);
    }

    @Override
    public HashMap<String, Long> getUserPeriodOrder(int uid) {
        return data.periodOrderQueryHelper(TYPE.USER, uid);
    }

    @Override
    public HashMap<String, Long> getUserPeriodOrder(int year, int uid) {
        return data.periodOrderQueryHelper(year,TYPE.USER,uid);
    }

    @Override
    public long getUserTurnover(int year, int month, int uid) {
        return data.getTurnoverQueryHelper(year, month, TYPE.USER, uid);
    }

    @Override
    public long getUserTotalOrder(int uid) {
        return data.getTotalOrderHelper(TYPE.USER, uid);
    }

    @Override
    public long getUserTotalTurnover(int uid) {
        return data.getTotalTurnoverHelper(TYPE.USER, uid);
    }

    @Override
    public long[] getUserTypeOrder(int uid) {
        long yep = (Long)template.find("select count(o.oid) from Orders o where o.uid=? and o.state=0",uid).get(0);
        long not = (Long)template.find("select count(o.oid) from Orders o where o.uid=? and o.state=1",uid).get(0);
        long cancel = (Long)template.find("select count(o.oid) from Orders o where o.uid=? and o.state=2",uid).get(0);
        long pjed = (Long)template.find("select count(o.oid) from Orders o where o.uid=? and o.state=3",uid).get(0);
        return new long[]{not,yep,cancel,pjed};
    }

    @Override
    public long getRegisterUserNum(int year, int month) {
        String hql = "select count(distinct a.uid) from Account a where year(a.logDate)=? and month(a.logDate)=?";
        return (Long)template.find(hql, year, month).get(0);
    }

    @Override
    public HashMap<String, Long> getUserSectionOrderNum(int uid) {
        HashMap<String, Long> result = new HashMap<>();
        String sql = "select floor(o.money/100) ,count(o.oid) from Orders o WHERE uid=? GROUP BY floor(o.money/100) order by floor(o.money/100) asc ";
        List<Object[]> list = (List<Object[]>) template.find(sql, uid);
        for(Object[] o:list){
            int t = (Integer)o[0];
            String s = t+"00-"+((t+1)*100-1);
            result.put(s, (Long)o[1]);
        }
        return result;
    }

}
