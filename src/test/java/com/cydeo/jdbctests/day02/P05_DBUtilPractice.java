package com.cydeo.jdbctests.day02;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

public class P05_DBUtilPractice {

    @Test
    public  void dbUtilPractice() {
        // Create conn
        DB_Util.createConnection();


        // Run Query
        DB_Util.runQuery("select first_name,last_name,salary from employees");

        System.out.println("GET ME FIRST ROW FIRST COLUMN --> STEVEN ");
        System.out.println(DB_Util.getFirstRowFirstColumn());

        System.out.println("GET ME ALL COLUMN NAMES");
        System.out.println(DB_Util.getAllColumnNamesAsList());

        System.out.println("GET ME ALL FIRST NAMES");
        System.out.println(DB_Util.getColumnDataAsList(1));


        System.out.println("GET ME HOW MANY ROW WE HAVE ");
        System.out.println(DB_Util.getRowCount());

        System.out.println("GET ME ALL DATA FROM EXECUTION");

        List<Map<String, String>> allRowAsListOfMap = DB_Util.getAllRowAsListOfMap();

        for (Map<String, String> eachMap : allRowAsListOfMap) {
            System.out.println(eachMap);
        }

        //Close Connection
        DB_Util.destroy();


    }
}
