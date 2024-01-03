<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Money</title>
    <link rel="stylesheet" href="transferMoney.css">
</head>
<body>
 <% long acNumber=(Long)session.getAttribute("acNumber");
String temp=(String)request.getAttribute("temp");

%>
    <div class="container">
        <h2>Transfer Money</h2>

        <form action="transferMoneyController.jsp" method="post">
         <input type="hidden" id="acNumber" name="acNumber" value="<%= acNumber %>" required>
            <label for="toAccount">To Account:</label>
            <input type="text" id="toAccount" name="toAccount" required><br>

            <label for="amount">Amount:</label>
            <input type="text" id="amount" name="amount" required><br>

            <input type="submit" value="Transfer Money">
        </form>

        <div class="result">
             <%if(temp!=null){
        	   %><%=temp %>
        	   
        	   
        	   <% }%>
           
       </div>

        <a href="home.jsp">Back to Home</a>
    </div>
</body>
</html>
