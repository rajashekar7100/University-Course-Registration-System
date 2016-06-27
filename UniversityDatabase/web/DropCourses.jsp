<%-- 
    Document   : DropCourses
    Created on : Apr 19, 2015, 9:50:08 PM
    Author     : rajashekar
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="servelet.LoginToStudentProf"%>
<%@page import="servelet.CoursesRegistered"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="/UniversityDatabase/DropCourses" method="POST">
        <%
            ArrayList<String> courses=(ArrayList<String>)request.getAttribute("courses");
        %>
        <h3>Currently Registered Courses</h3>
        <div>
        <table>
            <tr>
                <td></td>
                <td>Course Name</td>
            </tr>
            
            <%
                   for(int i=0;i<courses.size();i++)
                   {
                     %>
            <tr>
                <td><input type="checkbox" name="dropBox" value=<%out.print(i);%> /></td>
                <td><%out.println(courses.get(i));%></td>
            </tr>
            <%}%>
            
        </table>
        </div>
            
            <div>
               
                <input type="submit" name="dropCourses">
            </div>
            
                        </form>

    </body>
</html>
