package com.tech.blog.dao;

import com.tech.blog.entities.User;
import static java.lang.System.out;
import java.sql.*;
import org.apache.jasper.tagplugins.jstl.core.Out;

public class UserDao {

    private Connection con;

    // if user want to create an object of this class using this constructor then we are required to pass connection as argument 
    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to database. This method will be used in servlet
    public boolean saveUser(User user) {

        boolean is_query_executed = false;
        // if this becomes ture, it means that our query has been executed successfully and user'data gets stored in the database.
        //else some error have occured.

        try {

            // user -> database
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";

            // this.con ->means con object of this class
            PreparedStatement pstmt = this.con.prepareStatement(query);

            // query is incomplete, so set values in the query using preparedStatement.
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            // execute the query
            pstmt.executeUpdate();
            is_query_executed = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return is_query_executed;

    }

//    get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {

        User user = null;

        try {

            String query = "select * from user where email =? and password=?";

//            prepared statement is used to set values of query in database
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

//            now all the details of user whose email is "email" and password is "password" will get store in object of ResultSet.
            ResultSet set = pstmt.executeQuery();

//            we are expecting only one user thats why we will use "if" instead of "while".
            if (set.next()) {
                user = new User();

//                fetch data from user
                String name = set.getString("name");
//                set data to user object
                user.setName(name);

//                set id of user fetched from database
                user.setId(set.getInt("id"));
//                set email of user fetched from database                
                user.setEmail(set.getString("email"));

                //                set gender of user fetched from database 
                user.setGender(set.getString("Gender"));
                //                set about of user fetched from database 
                user.setAbout(set.getString("about"));

                //                set date-time of user fetched from database 
                user.setDatetime(set.getTimestamp("regdate"));

                //                set profile image of user fetched from database
                user.setProfile(set.getString("profile"));

//                now the user object with all the details will be returned
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = "update user set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.setString(6, user.getProfile());
            ps.setInt(7, user.getId());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId) {

        User user = null;

        try {

            String q = "select * from user where id = ?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if(set.next()){
                
                user = new User();

//                fetch data from user
                String name = set.getString("name");
//                set data to user object
                user.setName(name);

//                set id of user fetched from database
                user.setId(set.getInt("id"));
//                set email of user fetched from database                
                user.setEmail(set.getString("email"));

                //                set gender of user fetched from database 
                user.setGender(set.getString("Gender"));
                //                set about of user fetched from database 
                user.setAbout(set.getString("about"));

                //                set date-time of user fetched from database 
                user.setDatetime(set.getTimestamp("regdate"));

                //                set profile image of user fetched from database
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;

    }

}
