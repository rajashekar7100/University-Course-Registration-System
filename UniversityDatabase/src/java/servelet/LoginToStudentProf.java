/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static servelet.DataBaseConnection.rs;

/**
 *
 * @author rajashekar
 */
@WebServlet(name = "LoginToStudentProf", urlPatterns = {"/LoginToStudentProf"})
public class LoginToStudentProf extends HttpServlet {
    
    static CoursesRegistered courses=null;
    static int totalCreditHours=0;
    static int uid=0;

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String userEnteredId=request.getParameter("id");
            String userEnteredPassword=request.getParameter("password");
            
        String query="select * from users where uid='"+userEnteredId+"'";
        
        DataBaseConnection db=new DataBaseConnection();
            ArrayList<Object> al=db.userInformation(query);
        
        if(al.size()>0)
        {
        if(userEnteredPassword.equals((String)al.get(3)))
        {
            out.println("Successfully logged in...."+(int)al.get(0));
            if(((String)al.get(4)).equals("student"))
            {
           
            db.getConnection();
            String queryUser="select * from students where uid="+(int)al.get(0);
            ArrayList<Object> studentList=db.studentInformation(queryUser);
            uid=(int)studentList.get(0);
            request.setAttribute("uid", (int)studentList.get(0));
            request.setAttribute("name",(String)studentList.get(1));
            request.setAttribute("email",(String)studentList.get(2));
            
                courses=(CoursesRegistered)studentList.get(3);
            request.setAttribute("course",(CoursesRegistered)studentList.get(3));
            totalCreditHours=(int)studentList.get(4);
            request.setAttribute("CrHrsRegistered",(int)studentList.get(4));
            
            
            RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("/Student.jsp");
            requestDispatcher.forward(request, response);
            
            
                
            
            }
            else
            {
                db.getConnection();
            String queryUser="select * from Professors where uid="+(int)al.get(0);
            ArrayList<Object> studentList=db.professorInformation(queryUser);
            uid=(int)studentList.get(0);
            request.setAttribute("uid", (int)studentList.get(0));
            request.setAttribute("name",(String)studentList.get(1));
            request.setAttribute("email",(String)studentList.get(2));
            
            
            RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("/Professor.jsp");
            requestDispatcher.forward(request, response);
            }
        }
        else
        {
               out.println("Failed to login. Invalid user-id password.....");
               response.sendRedirect("/UniversityDatabase/Login.jsp");
        }
        }
        else
        {
            out.println("Failed to login. Not registered.....");
        }
            
        }    }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginToStudentProf.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            System.out.println("EXCEPTION: "+ex);
        }
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
