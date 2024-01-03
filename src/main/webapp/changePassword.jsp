<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <link rel="stylesheet" href="changePassword.css">
</head>
<body>
 <% long acNumber=(Long)session.getAttribute("acNumber");
String temp=(String)request.getAttribute("temp");

%>
    <div class="container">
        <h2>Change Password</h2>

        <form action="changePasswordController.jsp" method="post">
            <input type="hidden" id="acNumber" name="acNumber" value="<%= acNumber %>" required>
            <label for="currentPassword">Current Password:</label>
            <input type="password" id="currentPassword" name="currentPassword" required><br>

            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required><br>

            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required><br>

            <input type="submit" value="Change Password">
        </form>

        <div class="result">
           <p><%if(temp!=null){
        	   %><p><%=temp %>
        	   </p>
        	   
        	   <% }%>
           
        	  </p>
           
        </div>

        <a href="home.jsp">Back to Home</a>
    </div>
</body>
</html>
