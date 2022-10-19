
package com.learn.myshop.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {
//    For count number of line in card or Any where if you want.....
    public static String get10Words(String desc)
    {
        String[] strs = desc.split(" ");
        if(strs.length>10)
        {
            String res = " ";
        for(int i=0;i<10;i++)
        {
        res = res+strs[i]+" ";
        }
        return (res + "....");
        }
        else
        {
        return (desc + "....");
        }
    
    }
    //for counting the number products and categories......
    public static Map<String,Long> getCounts(SessionFactory factory)
    {
        Session session = factory.openSession();
        Map<String,Long> map = new HashMap<>();
        
        try {
            String q1 = "Select count(*) from User";
        String q2 = "Select count(*) from Product";
        Query query1 = session.createQuery(q1);
        Query query2 = session.createQuery(q2);
       Long userCount = (Long)query1.list().get(0);
       Long produtCount = (Long)query2.list().get(0);
       
       map.put("userCount", userCount);
       map.put("productCount",produtCount);
         session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
         return map;
    }
    
}
