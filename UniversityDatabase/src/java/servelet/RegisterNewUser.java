/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.internet.MailDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rajashekar
 */
@WebServlet(name = "RegisterNewUser", urlPatterns = {"/RegisterNewUser"})
public class RegisterNewUser extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int uid = Integer.parseInt(request.getParameter("uid")); 
           String email=request.getParameter("email");
           String password=request.getParameter("pass");
           String name=request.getParameter("name");
           SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
           String date= request.getParameter("dob");
           Date parse=format.parse(date);
           java.sql.Date dob=new java.sql.Date(parse.getTime());
           String position=request.getParameter("mydropdown");
           String department=request.getParameter("departmentList");
           int departmentNo=Integer.parseInt(department);
          
          String query = " insert into users (uid, email, password, name, dob, position)"
        + " values ("+uid+", '"+email+"', '"+password+"', '"+name+"', '"+dob+"', '"+position+"')";
          
         DataBaseConnection db = new DataBaseConnection();
         
         db.commonUpdateQuery(query);
		
         if(position.equals("student"))
         {
             db.getConnection();
             query="insert into students (uid,name,Deptno,email,courses,CrHrsRegistered) values ("+uid+",'"+name+"',"+departmentNo+",'"+email+"',"+null+","+null+")";
             db.commonUpdateQuery(query);
         
         }
         else if(position.equals("professor"))
         {
             db.getConnection();
            query="insert into professors (uid,name,Dno,email,Cid,CrHrsUndertook,salary,state) values ("+uid+",'"+name+"',"+1+",'"+email+"',"+null+","+null+","+60000+",'"+"NY"+"')";
             db.commonUpdateQuery(query);
         }
             
         
           
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterNewUser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(RegisterNewUser.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegisterNewUser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(RegisterNewUser.class.getName()).log(Level.SEVERE, null, ex);
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
