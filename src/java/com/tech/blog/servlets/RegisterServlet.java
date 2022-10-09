
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@MultipartConfig // wihtout this servlet will not accept some data. Hence it is required.
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet RegisterServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
            
            //fetch all data from form
            
            String check = request.getParameter("check");
            if(check == null){
                
                out.println("Please, Agree terms & conditions");
            }
            else{
                
                String name = request.getParameter("user_name");    // data comming from field : "user_name"
                String email = request.getParameter("user_email");  // data comming from field : "user_email"
                String password = request.getParameter("user_password");    // data comming from field : "user_password"
                String gender = request.getParameter("gender");     // data comming from field : "gender"
                String about = request.getParameter("about");       // data comming from field : "about"
                
                //Create user object to set all the data fetched above from "form".
                User user = new User(name,email,password,gender,about);
                
                // All the form data now contained in its corresponding string.
                
                // insert data :- We don't need to create connection again here ,because we have already wrote the code
                // for connection in UserDao.java class. So we just have to create object of UserDao here
                
                // We don't need to insert data from this servlet as we have created UserDao.java class for that.
                
                // create UserDao object
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                // Now save user data in database  
                if(dao.saveUser(user)){ // saveUser() internally perform querry to save user data into database, and return boolean value, if true successfuully user data inserted into database else some error has occured.
                    //saved
                    out.println("Successfully registered!!");
                }
                else{
                    out.println("error");
                }
            }
            
            
            
//            out.println("</body>");
//            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
