<%-- 
    Document   : NewUser
    Created on : Apr 16, 2015, 12:17:20 PM
    Author     : rajashekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
    </head>
    <body>
        <h6 style="font-size:150%">Enter Details For New Registration</h6>
        <form action="/UniversityDatabase/RegisterNewUser" method="POST" >
            <div data-role="fieldcontain" >
<div id="a" class="uname">
<label for="name"><font size="5" color="black">  UID:  </font></label>
<input type="text" name="uid"  id="text" data-mini="true" value=""/>
</div>
  <div id="a" class="uname">
<label for="name"><font size="5" color="black">  EMAIL:  </font></label>
<input type="text" name="email"  id="text" data-mini="true" value=""/>
</div> 
                <div id="a" class="uname">
<label for="name"><font size="5" color="black">  PASSWORD:  </font></label>
<input type="text" name="pass"  id="text" data-mini="true" value=""/>
</div>
                <div id="a" class="uname">
<label for="name"><font size="5" color="black">  NAME:  </font></label>
<input type="text" name="name"  id="text" data-mini="true" value=""/>
</div>
                <div id="a" class="uname">
<label for="name"><font size="5" color="black">  DOB(YYYY/DD/MM):  </font></label>
<input type="text" name="dob"  id="text" data-mini="true" value=""/>
</div>
                <div id="a" class="uname">
<label for="name"><font size="5" color="black">  POSITION:  </font></label>
<select name="mydropdown">
<option value="student">student</option>
<option value="professor">professor</option>
</select></div>

                <div id="a" class="uname">
<label for="name"><font size="5" color="black">  POSITION:  </font></label>
<select name="departmentList">
<option value="1">Computer Science</option>
<option value="2">Electrical Engineering</option>
<option value="3">Mechanical Engineering</option>
<option value="4">Musical Learning</option>
<option value="5">Psychology</option></select></div>

<br>
                <div id="a" class="uname">
<INPUT TYPE="submit" NAME="Register">
        </div>
            
            </form>
    </body>
</html>
