package com.cydeo.jdbctests.day02;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P04_ListOfMap {

    String dbURL ="jdbc:oracle:thin:@54.158.207.205:1521:xe";
    String dbUsername = "hr";
    String dbPassword = "hr";
    @Test
    public void listOfMap() throws SQLException {

        // DriverManager class will help us to create connection with the help getConnection method
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // It helps us to execute queries
        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        // ResultSet Object will store data after execution.It stores only data
        ResultSet rs = stmnt.executeQuery("select * from REGIONS");

        // ResultSetMetaData
        ResultSetMetaData rsmd = rs.getMetaData();


        // Create a list to put maps for each row
        List<Map<String,Object>> dataList=new ArrayList<>();

        //iterate each row
        while(rs.next()){
            // store data for that row into Map
            Map<String,Object> rowMap=new HashMap<>();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                rowMap.put(rsmd.getColumnName(i),rs.getString(i));
            }

            dataList.add(rowMap);

        }

        System.out.println("PRINT ALL DATA FROM ANY QUERY");
        for (Map<String, Object> eachRow : dataList) {
            System.out.println(eachRow);
        }



        rs.close();
        stmnt.close();
        conn.close();

    }
}
