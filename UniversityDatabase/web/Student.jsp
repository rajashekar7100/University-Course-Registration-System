<%-- 
    Document   : Student
    Created on : Apr 14, 2015, 5:04:33 PM
    Author     : rajashekar
--%>

<%@page import="servelet.CoursesRegistered"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student details</title>
        
    </head>
    
    <body>
        
        <form action="/UniversityDatabase/checkIdPass" method="POST" >  
                
            <%
              //  ArrayList al=(ArrayList)request.getAttribute("list");
            String uid=request.getAttribute("uid").toString();
            String name=request.getAttribute("name").toString();
            String email=request.getAttribute("email").toString();
            CoursesRegistered course=(CoursesRegistered)request.getAttribute("course");
            request.setAttribute("courses",course);
            String CrHrsRegistered=request.getAttribute("CrHrsRegistered").toString();
            %>
            <h3>Name: <% out.println(name); %> </h3>
            <h3>ID: <% out.println(uid); %></h3>
        <h3>Email: <% out.println(email); %></h3>
        <h3>Courses Registered: <% if(course!=null){
            for(int i=0;i<course.courses.size();i++)
            {
            out.println(course.courses.get(i));}
        }else{out.println("Not registered");}%></h3>
        <h3>Credit Hours Registered: <% if(CrHrsRegistered!=null){out.println(CrHrsRegistered);}else{out.println("0");} %></h3>
        
        
        </form>
        
        <div>
        <form action="/UniversityDatabase/Course.jsp" method="POST">
        
            <input type="submit" value="Add">
            <input type="hidden" value=<%out.println(uid);%> name="uid">
           
        </form>
            <br>
        <form action="/UniversityDatabase/DeleteCourses" method="POST">    
        <input type="submit" value="Drop">
        </form>
        </div>
        
        
    </body>
    
</html>
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
   