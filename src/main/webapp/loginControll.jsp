<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" %>
    <%@   page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%long acNumber=Long.parseLong(request.getParameter("acNumber"));
String pass1=request.getParameter("password");

try
{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/atm";
		String root="root";
		String pass2="";

		 
	Connection con = DriverManager.getConnection(url,root,pass2);
	String query="select * from BankDetails where acNumber= ? AND password= ? ";
	PreparedStatement ps= con.prepareStatement(query);
	ps.setLong(1,acNumber);
	ps.setString(2,pass1);
	ResultSet rs=ps.executeQuery();
	
	int count=0;
	String s=null;
	
	
	
	while(rs.next())
	{
		count++;
		
	    s=rs.getString(2);
	    
	    
}
	if(count==1)
	{
		session.setAttribute("acNumber",acNumber);
		session.setAttribute("name", s);
		response.sendRedirect("home.jsp");
	}
	
	
	
}
 catch (Exception e) 
{
	out.print(e);	
}



	%> 
</body>
</html>