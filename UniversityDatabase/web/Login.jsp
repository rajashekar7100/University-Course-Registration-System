<%-- 
    Document   : Login
    Created on : Apr 10, 2015, 3:49:05 PM
    Author     : rajashekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
           <form action="/UniversityDatabase/LoginToStudentProf" method="POST" >  
                
                
        <h1> User id:</h1>
        <INPUT TYPE="TEXT" NAME="id" id="uid">
        <h1> Password:</h1>
        <INPUT TYPE="TEXT" NAME="password" id="pass">
        <INPUT TYPE="submit" NAME="submitbutton">
        
           </form>
        
    </body>
</html>
