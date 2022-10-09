package com.tech.blog.servlets;

import com.tech.blog.helper.Helper;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

// MULTIPART ANNOTAION -> TELL THE SERVLET THAT THIS SERVLET HAS TO DEAL WITH -> FILE TYPE OF DATA (LIKE IMAGES)
@MultipartConfig
public class EditServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // FETCH ALL DATA FROM EDIT FORM -- NEW DATA TO BE UPDATED
            String userEmail = request.getParameter("user_email");
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");

            // USE PART TO FETCH IMAGE
            Part part = request.getPart("profile-image");

            // GET NAME OF IMAGE ALONG WITH EXTENCTION
            String imageName = part.getSubmittedFileName();

            // FETCH USER'S  OLD DATA FROM THE RUNNING SESSION   
            // THAT IS CURRENT USER OBJECT THAT WAS CREATED IN USERDAO.JAVA SERVLET
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            // TASK IS TO REPLACE "user" DETAILS WITH NEW DATA FETCHED FROM EDIT FORM.
            user.setName(userName);
            user.setEmail(userEmail);
            user.setAbout(userAbout);
            user.setPassword(userPassword);
            String oldFile = user.getProfile();
            user.setProfile(imageName);

            // METHOD IS NON-STATIC SO, TO CALL THAT METHOD WE NEED TO CREATE AN OBJECT OF USERDAO.
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean flag = userDao.updateUser(user);

            // If successully updated
            if (flag) {

                // UPDATE PROFILE PHOTO : UNABLE TO UPLOAD BECAUSE THIS PROJECT FOLDER IS PRESENT IN THAT DIRECTORY WHERE WE CAN READ ONLY WRITE IN NOT ALLOWED.
                String path = request.getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
                // System.out.println(path);
                String pathOldFile = request.getServletContext().getRealPath("/") + "pics" + File.separator + oldFile;
                
                if(!oldFile.equals("default.png"))
                    Helper.deleteFile(pathOldFile);

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Updated successfully...");
                    Message msg = new Message("Profile Updated...", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                    out.println("File Not saved successfully");
                    Message msg = new Message("Something went Wrong...!", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }

            } else {
                out.println("Not Updated...");
                Message msg = new Message("Something went Wrong...!", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }

            response.sendRedirect("profile_page.jsp");

            out.println("</body>");
            out.println("</html>");
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
