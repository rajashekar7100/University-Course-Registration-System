<%-- 
    Document   : Course
    Created on : Apr 14, 2015, 5:41:22 PM
    Author     : rajashekar
--%>

<%@page import="servelet.CoursesRegistered"%>
<%@page import="servelet.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course List</title>
    </head>
    <body>
        <form action="/UniversityDatabase/EnterRegisteredCourses" method="POST">
        
        <%
            int uid=Integer.parseInt(request.getParameter("uid"));
            CoursesRegistered courses=(CoursesRegistered)request.getAttribute("courses");
            request.setAttribute("courses",courses);
            DataBaseConnection db=new DataBaseConnection();
            
            String query="select * from courses";
            ResultSet rs= db.getCourseInformation(query);
            int i=0;
        %>
                <input type="hidden" value=<%out.println(uid);%> name="uid">
               
        
        <table >
            <tr align>
                <td align="center"> </td>
                <td align="center">Course Id</td>
                <td align="center">Course Name</td>
                <td align="center">PID</td>
                <td align="center">Course hours</td>
                <td align="center">Semester</td>
                <td align="center">Seats Available</td>
                <td align="center">Waiting List</td>
                <td align="center">Remaining Seats</td>
            </tr>
            
            <% while(rs.next()){%>
            <tr>
                <td align="center"><input type="checkbox" name="box"  value=<%out.println(rs.getInt(1));%>/> </td>
                <td align="center"><% out.println(rs.getInt(1)); %></td>
                <td align="center"><% out.println(rs.getString(2)); %></td>
                <td align="center"><% out.println(rs.getInt(3)); %></td>
                <td align="center"><% out.println(rs.getInt(5)); %></td>
                <td align="center"><% out.println(rs.getString(6)); %></td>
             
                
            </tr>
            <% i++;} rs.close();%>
        </table>
        <input type="submit" name="submitbutton">
        </form> 
    </body>
</html>
