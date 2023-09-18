package com.cydeo.jdbctests.day02;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {
    String dbURL ="jdbc:oracle:thin:@54.158.207.205:1521:xe";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void flexibleNavigation() throws SQLException {

        // DriverManager class will help us to create connection with the help getConnection method
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // It helps us to execute queries
        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

        // ResultSet Object will store data after execution.It stores only data
        ResultSet rs = stmnt.executeQuery("select FIRST_NAME,LAST_NAME from EMPLOYEES");

        //get me first row info
        rs.next();
        System.out.println(rs.getString(1)+" "+rs.getString(2));

        // get me second row
        rs.next();
        System.out.println(rs.getString(1)+" "+rs.getString(2));

        /*ResultSet.TYPE_SCROLL_INSENSITIVE--> To do flexible navigation
        ResultSet.CONCUR_READ_ONLY -->  This type of ResultSet Object is not updatable
*/




        //get me last row information
        // last() --> true if the cursor is on a valid row; false if there are no rows in the result set
        rs.last();
        System.out.println(rs.getString(1)+" "+rs.getString(2));


        // How many row we have ?
        // getRow -->  the current row number; 0 if there is no current row
        System.out.println("rs.getRow() = " + rs.getRow()); // 107


        // get data from row 8
        rs.absolute(8);
        System.out.println("rs.getRow() = " + rs.getRow()); // 8
        System.out.println(rs.getString(1)+" "+rs.getString(2));


//How can we get how many row we have
            rs.last();
            int rowNumber =rs.getRow();



        //rs.previous -- > true if the cursor is now positioned on a valid row; false if the cursor is positioned before the first row
        rs.previous();   // 7
        System.out.println(rs.getString(1)+" "+rs.getString(2));

        // to print all data from beginning we need to move cursor into beforeFirstRow
        // Moves the cursor to the front of this ResultSet object, just before the first row. This method has no effect if the result set contains no rows.
        rs.beforeFirst();


        // HOW TO PRINT ALL RESULT SET INFO
        System.out.println(" HOW TO PRINT ALL RESULT SET INFO ");
        while(rs.next()){

            System.out.println(rs.getRow()+"-"+rs.getString(1)+" "+rs.getString(2));

        }


        //System.out.println(rs.getMetaData());


        // CLOSE CONNECTION
        rs.close();
        stmnt.close();
        conn.close();
    }
}
