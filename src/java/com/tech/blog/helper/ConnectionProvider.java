package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

    // create connection object - to extablish connection with database. will help to fire query
    private static Connection con;

    // create method to return Connection
    public static Connection getConnection() {

        // creating connection using try catch because checked exception may come which is a sql exception.
        try {
            
            // if condition will prevent the creation of connection everytime whenever this method is called.
            if (con == null) {

                // 1. Load Driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                // 2. Create connection. Created connection will store in con variable.
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "rootroot");
                
                // getConnection("URL", "user_name", "password") asks for URL of the Database.
                // "techblog is the name of database.

            }

        } catch (Exception e) {
            // if any execption occur then it is very important to print its trace. why ?
            e.printStackTrace();
        }
        return con;
    }
}
