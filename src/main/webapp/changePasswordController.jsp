<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	long acNumber = Long.parseLong(request.getParameter("acNumber")); 
	String curpass = request.getParameter("currentPassword");
	String newpass = request.getParameter("newPassword");
	String conpass = request.getParameter("confirmPassword");
	
   
	if(!newpass.equals(conpass)){
	String temp="New Password and Confirm Password are not same";
	request.setAttribute("temp", temp);
	request.getRequestDispatcher("changePassword.jsp").forward(request, response);
	
	}
	 
    
	try {
        String url = "jdbc:mysql://localhost:3306/atm";
        String user = "root";
        String password = "";

        Connection con = DriverManager.getConnection(url, user, password);

        String query="update bankdetails set password= ?where acNumber=? and password=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setLong(2, acNumber);
        ps.setString(1, newpass);
        ps.setString(3, curpass);

       int  row = ps.executeUpdate();
       if(row==1){
    	   String temp="Password changed Successfully";
    		request.setAttribute("temp", temp);
    		request.getRequestDispatcher("changePassword.jsp").forward(request, response); 
       }
       else{
    	   String temp="Re Enter the correct password";
   		request.setAttribute("temp", temp);
   		request.getRequestDispatcher("changePassword.jsp").forward(request, response); 
       }
	}
	 catch (SQLException e) {
     	
         e.printStackTrace();
     } 
        
        

%>
</body>
</html>