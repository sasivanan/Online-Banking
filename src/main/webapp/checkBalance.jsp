<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Balance</title>
    <link rel="stylesheet" href="checkBalance.css">
</head>
<body>
    <% 
        Long acNumberObj = (Long) session.getAttribute("acNumber");
        long acNumber = (acNumberObj != null) ? acNumberObj : 0L;

        Double balanceResult = (Double) request.getAttribute("balanceResult");
        Long acNumberFromRequest = (Long) request.getAttribute("acNumber");
    %>

    <div class="container">
        <h2>Check Balance</h2>

        <form action="checkBalanceController.jsp" method="post">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="hidden" id="acNumber" name="acNumber" value="<%= acNumber %>" required>

            <input type="submit" value="Check Balance">
        </form>

        <div class="result">
            <% if (balanceResult != null && acNumberFromRequest != null && acNumberFromRequest.equals(acNumber)) { %>
                <p>Account Number: <%= acNumberFromRequest %></p>
                <p>Balance: Rs.<%= balanceResult %></p>
            <% } %>
        </div>

        <a href="home.jsp">Back to Home</a>
    </div>
</body>
</html>
