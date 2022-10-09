/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author amanraj
 */
public class Helper {

    // DELETE IMAGE FILE TO UPDATE WITH NEW FILE
    public static boolean deleteFile(String path) {

        boolean flag = false;
        try {
            File file = new File(path);
            flag = file.delete(); // delete the file with given path. If deleted then flag will become true else flag becomes false.

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    // InputStream class is the superclass of all the io classes i.e. representing an input stream of bytes.
    public static boolean saveFile(InputStream is, String path) {

        boolean flag = false;

        try {
            byte b[] = new byte[is.available()];
            is.read(b);  //   READ(B) WILL READ DATA FROM INPUT-STREAM AND PUT THAT DATA INTO BYTE ARRAY.
            try ( //NOW TO WRITE DATA
                FileOutputStream fos = new FileOutputStream(path)) {
                fos.write(b);
                fos.flush();
            }
            flag = true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }
}
