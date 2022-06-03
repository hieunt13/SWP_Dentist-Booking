/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author hieunguyen
 */
public class DBUtils {
    public static Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        }
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    
    private final static String serverName = "AnHoang";
    private final static String dbName = "DentistBooking";
    private final static String portNumber = "1433";
    private final static String instance = "";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final static String userID = "sa";
    private final static String password = "0000";
//        Connection conn= null;
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        String url= "jdbc:sqlserver://localhost:1433;databaseName=DentistBooking";
//        conn= DriverManager.getConnection(url,"sa","123");
//        return conn;
    }



