package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> listOfCategories = new ArrayList<Category>();

        try {
            String q = "select * from categories";
            /*

            The Statement interface provides methods to execute queries with the database.
            1) public ResultSet executeQuery(String sql):
                is used to execute SELECT query. It returns the object of ResultSet.
            
            2) public int executeUpdate(String sql): 
                is used to execute specified query, it may be create, drop, insert, update, delete etc.
                
            3) public boolean execute(String sql): 
                is used to execute queries that may return multiple results.


             */
            Statement s = this.con.createStatement();
            ResultSet set = s.executeQuery(q);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("cname");
                String desc = set.getString("description");
                Category c = new Category(cid, name, desc);
                listOfCategories.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listOfCategories;
    }

    public boolean savePost(Post p) {
        boolean flag = false;

        try {

            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    //GET ALL THE POST to show on profile page
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();

        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pCOntent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userID");

                Post post = new Post(pid, pTitle, pCOntent, pCode, pPic, date, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // GET POST BY CATEGORY corresponding to a particular id. And show on profile page.
    public List<Post> getPostByCatId(int catId) {

        List<Post> list = new ArrayList<>();

        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts where catId=?");
            pstmt.setInt(1, catId);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pCOntent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userID");

                Post post = new Post(pTitle, pCOntent, pCode, pPic, date, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public Post getPostByPostId(int postId) {

        Post post = null;

        try {

            String q = "select * from posts where pid = ?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pCOntent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userID");

                post = new Post(pid, pTitle, pCOntent, pCode, pPic, date, catId, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return post;
    }

}
