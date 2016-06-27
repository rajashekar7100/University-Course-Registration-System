/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rajashekar
 */
@WebServlet(name = "EnterRegisteredCourses", urlPatterns = {"/EnterRegisteredCourses"})
public class EnterRegisteredCourses extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int uid=Integer.parseInt(request.getParameter("uid"));
            CoursesRegistered courses=LoginToStudentProf.courses;
            if(courses==null)
                courses=new CoursesRegistered();
            String[] results = request.getParameterValues("box");
            DataBaseConnection db=null;
           
            int totalCreditHours=0;
            for (int i = 0; i < results.length; i++) {
               db=new DataBaseConnection();
               String token[]=db.getCourseName("select Cname,CrHrs from courses where CID="+Integer.parseInt(results[i])).split("&");
                courses.courses.add(token[0]);
                 LoginToStudentProf.totalCreditHours=LoginToStudentProf.totalCreditHours+Integer.parseInt(token[1]);
        }
            
      
        
           db=new DataBaseConnection();
            
            db.insertQuery(courses,LoginToStudentProf.totalCreditHours, uid);
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(EnterRegisteredCourses.class.getName()).log(Level.SEVERE, null, ex);
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
