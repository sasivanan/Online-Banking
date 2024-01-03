<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
ArrayList<ArrayList<String>> list = new ArrayList<>();
long acNumber = Long.parseLong(request.getParameter("acNumber")); 
try {
    String url = "jdbc:mysql://localhost:3306/atm";
    String user = "root";
    String password = "";
    out.println("hellow");
    Connection con = DriverManager.getConnection(url, user, password);
    String tableName = "acNumber_" + String.valueOf(acNumber);
    out.println("hellow2");
    String query = "SELECT * FROM " + tableName ;

    PreparedStatement ps = con.prepareStatement(query);
    out.println("hellow3");
    ResultSet rs = ps.executeQuery();
    out.println("hellow1");
    while (rs.next()) {
        ArrayList<String> list1 = new ArrayList<>();
        list1.add(rs.getString(2));
        list1.add(String.valueOf(rs.getLong(3)));
        list1.add(String.valueOf(rs.getLong(4)));
        list1.add(String.valueOf(rs.getLong(5)));
        list1.add(String.valueOf(rs.getDate(6)));
        list1.add(String.valueOf(rs.getTime(7))); // Use correct index for the time column
        list.add(list1);
    }
    request.setAttribute("temp", list);
    request.getRequestDispatcher("viewTransactions.jsp").forward(request, response); 
} catch (SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html> 
