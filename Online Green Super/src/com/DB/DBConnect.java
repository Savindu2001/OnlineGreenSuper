package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    
    private static Connection conn;

    public static Connection getConn() {
        String dburl = "jdbc:mysql://localhost:3306/greenshop";
        String dbuser = "root";
        String dbpassword = "SSjw3wby";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
            return conn;
        } catch (ClassNotFoundException | SQLException e) {
            // Log the exception for debugging purposes
            e.printStackTrace();
            return null;
        }
    }

    // Close the connection when it's no longer needed
    public static void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                // Log the exception for debugging purposes
                e.printStackTrace();
            }
        }
    }
}
