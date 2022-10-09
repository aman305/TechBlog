
package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
    
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp datetime;
    private String profile;

    
//    constructors
    public User(int id, String name, String email, String password, String gender, String about) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        
    }

    public User() {
    }

    public User(String name, String email, String password, String gender, String about) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        
    }
    
    
//    geters and setters

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getProfile() {
        return profile;
    }
    
    public String getGender() {
        return gender;
    }

    public String getAbout() {
        return about;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    
    
    
    
    
}
