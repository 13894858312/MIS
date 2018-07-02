import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by wangxue on 2018/6/30.
 */
public class Test1 {
    @Test
    public void date(){
        System.out.println(Calendar.getInstance());
        int date = Calendar.YEAR*10000+(Calendar.MONTH+1)*100+Calendar.DAY_OF_MONTH;
        System.out.println(date);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = new Date();
        System.out.println(dateFormat.format(date1));
    }

    @Test
    public void date2(){
        System.out.println(100*2/54);
    }
}
