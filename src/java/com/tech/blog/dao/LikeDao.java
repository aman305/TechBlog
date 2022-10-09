package com.tech.blog.dao;

import com.mysql.cj.xdevapi.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

    // create connection and to initilize this connection create a constructor.
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {

        boolean flag = false;
        try {

            String q = "insert into liked(pid, uid) values(?,?)";
            PreparedStatement ps = this.con.prepareStatement(q);

            // set values
            ps.setInt(1, pid);
            ps.setInt(2, uid);

            // if we are not fetching data from database then use executeUpdate().
            // if fethcing from database then use executeQuery().
            ps.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public int coutLikeOnPost(int pid) {

        int count = 0;

        try {
            String q = "select count(*) from liked where pid=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, pid);

            ResultSet set = ps.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {

        boolean flag = false;

        try {

            PreparedStatement ps = this.con.prepareStatement("select * from liked where pid=? and uid=?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }
    
    public boolean deleteLike(int pid, int uid){
        
        boolean flag = false;
        try{
            PreparedStatement ps = this.con.prepareStatement("delete from liked where pid=? and uid=?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return flag;
    }

}
