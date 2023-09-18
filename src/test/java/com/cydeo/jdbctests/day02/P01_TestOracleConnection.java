package com.cydeo.jdbctests.day02;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_TestOracleConnection {
    String dbURL ="jdbc:oracle:thin:@54.158.207.205:1521:xe";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void testConnection() throws SQLException {

        // DriverManager class will help us to create connection with the help getConnection method
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // It helps us to execute queries
        Statement stmnt = conn.createStatement();

        // ResultSet Object will store data after execution.It stores only data
        ResultSet rs = stmnt.executeQuery("select * from regions");

        // If we wanna get data from database we are gonna implement in here
        /*
        // GET ME FIRST ROW REGION ID
        // next() --> true if the new current row is valid; false if there are no more rows
        rs.next();
        System.out.println(" FIRST ROW INFO ");

        // COLUMNINDEX + COLUMNLABEL
        System.out.println("rs.getString(1) = " + rs.getString(1));
        System.out.println("rs.getString(\"REGION_ID\") = " + rs.getString("REGION_ID"));

        System.out.println("rs.getInt(1) = " + rs.getInt(1));
        System.out.println("rs.getInt(\"REGION_ID\") = " + rs.getInt("REGION_ID"));

        // GET ME FIRST ROW REGION_NAME
        System.out.println("rs.getString(2) = " + rs.getString(2));
        System.out.println("rs.getString(\"REGION_NAME\") = " + rs.getString("REGION_NAME"));


        // SECOND ROW  2 - Americas
        rs.next();
        System.out.println(" SECOND ROW INFO ");

        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        // THIRD ROW  3 - Asia
        rs.next();
        System.out.println(" THIRD ROW INFO ");
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        // FOURTH ROW  4 - Middle East and Africa
        rs.next();
        System.out.println(" FOURTH ROW INFO ");
        System.out.println(rs.getString(1)+" - "+rs.getString(2));
*/



        // What if we have 1000 line in resultset ?

        while(rs.next()){

            System.out.println("------");
            System.out.println(rs.getString(1)+" - "+rs.getString(2));

        }



        // CLOSE CONNECTION
        rs.close();
        stmnt.close();
        conn.close();
    }
}
