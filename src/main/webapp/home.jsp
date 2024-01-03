<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
    <%@   page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Home Page</title>
    <link rel="stylesheet" href="home.css">
</head>
<body>
<%

String name=(String)session.getAttribute("name");
long acNumber=(Long)session.getAttribute("acNumber");
session.setAttribute("acNumber",acNumber);

%>
    <div class="container">
        <h2>Welcome to Online Banking , <% out.print(name); %></h2>

        <div class="options">
            <ul>
                <li><a href="checkBalance.jsp">Check Balance</a></li>
                <li><a href="changePassword.jsp">Change Password</a></li>
                <li><a href="viewTransactions.jsp">View Transactions</a></li>
                <li><a href="transferMoney.jsp">Transfer Money</a></li>
            </ul>
        </div>

        <form action="login.jsp" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
