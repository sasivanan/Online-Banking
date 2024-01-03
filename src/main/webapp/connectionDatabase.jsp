<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
    <%@   page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String url="//localhost:3306/atm";
String pass="root";
String pass1="";

	Class.forName("com.mysql.jdbc.Driver");
	 DriverManager.getConnection(url,pass,pass1); %>
</body>
</html>