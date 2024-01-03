<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Transactions</title>
    <link rel="stylesheet" href="viewTransactions.css">
</head>
<body>
<%
    long acNumber = (Long)session.getAttribute("acNumber");
    ArrayList<ArrayList<String>> temp = (ArrayList<ArrayList<String>>)request.getAttribute("temp");
%>
<div class="container">
    <h2>View Transactions</h2>

    <form action="viewTransactionsController.jsp" method="post">
        <input type="hidden" id="acNumber" name="acNumber" value="<%= acNumber %>" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <input type="submit" value="View Transactions">
    </form>

    <div class="transaction-history">
        <% if (temp != null) { %>
            <table border="1">
                <thead>
                    <tr>
                        <th>Type of Transaction</th>
                        <th>Account Number</th>
                        <th>Transfer Amount</th>
                        <th>Balance Amount</th>
                        <th>Date of Transaction</th>
                        <th>Time of Transaction</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < temp.size(); i++) { %>
    <tr>
        <% for (int j = 0; j < temp.get(i).size(); j++) { %>
            <td><%= temp.get(i).get(j) %></td>
        <% } %>
    </tr>
<% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <a href="home.jsp">Back to Home</a>
</div>
</body>
</html>
