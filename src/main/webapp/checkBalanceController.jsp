<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Balance Controller</title>
    <link rel="stylesheet" href="checkBalance.css">
</head>
<body>
    <% 
        String pass1 = request.getParameter("password");
        long acNumber = Long.parseLong(request.getParameter("acNumber"));

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String url = "jdbc:mysql://localhost:3306/atm";
            String user = "root";
            String password = "";

            con = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM BankDetails WHERE acNumber = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setLong(1, acNumber);
            ps.setString(2, pass1);

            rs = ps.executeQuery();

            int count = 0;
            double balance = 0.0;

            while (rs.next()) {
                count++;
                balance = rs.getDouble(4);
            }

            if (count > 0) {
                request.setAttribute("balanceResult", balance);
                request.setAttribute("acNumber", acNumber);
                request.getRequestDispatcher("checkBalance.jsp").forward(request, response);
            } else {
                out.println("Enter the correct password .");
            }

        } catch (SQLException e) {
        	
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
