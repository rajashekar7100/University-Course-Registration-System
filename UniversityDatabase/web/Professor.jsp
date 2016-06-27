<%-- 
    Document   : Professor
    Created on : Apr 14, 2015, 5:33:12 PM
    Author     : rajashekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Professor Details</title>
    </head>
    <body>
        
         <form action="/UniversityDatabase/checkIdPass" method="POST" >  
                
        
        <h4>Name:<% out.println(request.getAttribute("name").toString());%></h4>
        <h4>ID:<% out.println(request.getAttribute("uid").toString());%></h4>
        <h4>Email:<% out.println(request.getAttribute("email").toString());%></h4>
        <h4>Courses 1:</h4>
        <button type="button">LookUp</button>
        <h4>Courses 2:</h4>
        <button type="button">LookUp</button>
        <h4>Courses 3:</h4>
        <button type="button">LookUp</button>
        
         </form>
        
    </body>
</html>
